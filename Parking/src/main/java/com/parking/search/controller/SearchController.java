package com.parking.search.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SearchController {
   
   private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
   

   //지도 연습
   @RequestMapping(value = "/project/search.do")
   public String mapTest() {
      //지도 호출
      return "search/Search";
   }
   
   
   
}