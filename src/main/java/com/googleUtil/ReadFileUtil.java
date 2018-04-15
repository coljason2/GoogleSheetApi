package com.googleUtil;


import java.io.File;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class ReadFileUtil {

	public File getFileData() {
		URL url;
		File file = null;
		try {
			// get URL content
			url = new URL("http://localhost:8080/GoogleSheetApi/resources/StoredCredential");
			URLConnection conn = url.openConnection();
			String fileName = "target/StoredCredential";
			file = new File(fileName);
			if (!file.exists()) {
				file.createNewFile();
			}
			Path path = Paths.get(file.getPath());
			Files.copy(conn.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return file;
	};
}
