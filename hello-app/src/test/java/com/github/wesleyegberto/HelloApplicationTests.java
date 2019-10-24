package com.github.wesleyegberto;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@WebMvcTest(GreetingsController.class)
public class HelloApplicationTests {
    @Autowired
    private MockMvc mvc;

    @Test
    public void shouldReturnHelloWorld() throws Exception {
        mvc.perform(get("/greetings"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("message", is("Hello World!")));
    }
}
