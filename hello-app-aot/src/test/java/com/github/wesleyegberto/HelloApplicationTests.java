package com.github.wesleyegberto;

import static org.hamcrest.Matchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;

@ExtendWith(SpringExtension.class)
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
