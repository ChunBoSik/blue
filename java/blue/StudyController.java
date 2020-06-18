package com.spring.blue;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/study")
public class StudyController {
  
  @RequestMapping(value="/checkTest", method=RequestMethod.GET)
  public String checkTestGet() {
    return "study/checkTest";
  }
}
