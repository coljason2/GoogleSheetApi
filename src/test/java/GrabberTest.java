import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.junit.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.graber.Graber;

public class GrabberTest {
	private static Logger logger = LoggerFactory.getLogger(GrabberTest.class);
	private static final String url = "https://tw.stock.yahoo.com/q/q?s=";

	@Test
	public void GrabberTest() throws IOException {
		Document doc = null;
		doc = Jsoup.connect(url + 2002).get();
		//System.out.println(doc.select("table").get(1).select("td").get(0).select("a").get(0).text());
		System.out.println(doc.select("table").get(1).select("td").get(3).select("b").text());
	}
}
