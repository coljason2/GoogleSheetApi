package com.graber;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.Vo.stockVo;
import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.model.UpdateValuesResponse;
import com.google.api.services.sheets.v4.model.ValueRange;
import com.googleUtil.SheetsServiceUtil;

public class updateStockTask extends TimerTask {
	private static Logger logger = LoggerFactory.getLogger(updateStockTask.class);
	private static String spreadsheetId = "1g2VzWZoO6JOPn4vHhGB7dkwoNsdxb7-WvLdSUPRDUqg";
	private static Sheets service;
	static {
		try {
			logger.info("service = {}", service);
			if (service == null)
				service = SheetsServiceUtil.getSheetsService();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		logger.info("start update google sheets");
		try {
			graberData();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void graberData() throws IOException, GeneralSecurityException {

		String range = "Stock!A2:C";
		ValueRange response = service.spreadsheets().values().get(spreadsheetId, range).execute();
		List<List<Object>> values = response.getValues();
		if (values == null || values.size() == 0) {
			System.out.println("No data found.");
		} else {
			List<stockVo> Stocks = new ArrayList<stockVo>();
			for (List row : values) {
				stockVo s = new stockVo();
				if (row.size() > 1) {
					s.setId(row.get(1).toString());
					s.setTargetPrice(Double.parseDouble(row.get(2).toString()));
					Stocks.add(s);
				}
			}

			WriteSheet(new Graber().grabberStock(Stocks));
		}
	}

	@SuppressWarnings("unchecked")
	private void WriteSheet(List<stockVo> data) {
		List ListData = new ArrayList<String>();
		for (stockVo s : data) {
			List RowData = Arrays.asList(s.getName(), s.getId(), s.getTargetPrice(), s.getNowPrice());
			ListData.add(RowData);
		}
		ListData.add(Arrays.asList("最後更新時間：" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())));
		try {
			ValueRange body = new ValueRange().setValues(ListData);
			UpdateValuesResponse result = service.spreadsheets().values().update(spreadsheetId, "A2", body)
					.setValueInputOption("RAW").execute();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

	}
}
