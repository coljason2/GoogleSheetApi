package com.googleUtil;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class ReadFileUtil {

	public void creatrStoredCredentialData() {
		File file = null;
		try {
			String fileName = "app/target/StoredCredential";
			file = new File(fileName);
			if (!file.exists()) {
				file.createNewFile();
			}
			Path path = Paths.get(file.getPath());
			Files.copy(ReadFileUtil.class.getResourceAsStream("/StoredCredential"), path,
					StandardCopyOption.REPLACE_EXISTING);
		} catch (Exception e) {
			e.printStackTrace();
		}

	};
}
