package com.controller;

import java.util.Timer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.graber.updateStockTask;

@Controller
public class AppController {
	private static Timer timer = null;
	private static Logger logger = LoggerFactory.getLogger(AppController.class);

	@RequestMapping(value = { "/", "/home", "/index" }, method = RequestMethod.GET)
	public String home(Model model) {
		return "/index";
	}

	@RequestMapping(value = { "/search" }, method = RequestMethod.GET)
	public String search(Model model) {
		return "/search";
	}

	@RequestMapping(value = { "/query" }, method = RequestMethod.GET)
	public String query(Model model) {
		return "/resault";
	}
	// @RequestMapping(value = { "/stockUpdate" }, method = RequestMethod.GET)
	// public String stockUpdate(ModelMap model) {
	// String msg = null;
	// if (timer == null) {
	// msg = "啟動成功，開始自動抓取資料";
	// timer = new Timer();
	// timer.schedule(new updateStockTask(), 1000, 60000);
	// } else {
	// msg = "服務已啟動過";
	// }
	// return "/index";
	// }

	@RequestMapping(value = "/page/{index}", method = RequestMethod.GET)
	public String page(@PathVariable("index") int index, Model model) throws InterruptedException {
		model.addAttribute("index", "this is page " + index);
		Thread.sleep(2000);
		return "/page";
	}

	@ResponseBody
	@RequestMapping(value = "/update")
	public String startUpdate(ModelMap model) {
		String msg = null;
		logger.info("timer = {} ", timer);
		if (timer == null) {
			msg = "Service is starting ! Grabber is ok!";
			timer = new Timer();
			timer.schedule(new updateStockTask(), 1000, 60000);
		} else {
			msg = "Service is started !! No more service start";
		}
		logger.info("msg = {} ", msg);
		return msg;
	}

}
