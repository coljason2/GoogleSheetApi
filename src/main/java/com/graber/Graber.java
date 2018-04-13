package com.graber;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.Vo.stockVo;

public class Graber {
	private static final String url = "https://tw.stock.yahoo.com/q/q?s=";

	public List<stockVo> grabberStock(List<stockVo> stocks) {
		Document doc = null;
		List<stockVo> Return_Stocks = new ArrayList<stockVo>();
		try {
			for (stockVo s : stocks) {
				stockVo new_stock = new stockVo();
				doc = Jsoup.connect(url + s.getId()).get();
				new_stock.setId(s.getId());
				new_stock.setName(doc.select("table").get(6).select("td").get(0).select("a").get(0).text());
				new_stock.setNowPrice(
						Double.parseDouble(doc.select("table").get(6).select("td").get(2).select("b").text()));
				new_stock.setTargetPrice(s.getTargetPrice());
				Return_Stocks.add(new_stock);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Return_Stocks;
	}
}
