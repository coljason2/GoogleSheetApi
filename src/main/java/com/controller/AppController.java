package com.controller;

import java.util.Timer;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.graber.updateStockTask;

@Controller
public class AppController {
	@RequestMapping(value = { "/", "/home", "/index" }, method = RequestMethod.GET)
	public String home(ModelMap model) {
		return "/index";
	}

	@RequestMapping(value = { "/stockUpdate" }, method = RequestMethod.GET)
	public String stockUpdate(ModelMap model) {

		Timer timer = new Timer();
		timer.schedule(new updateStockTask(), 1000, 60000);
		return "/index";
	}
}
