package com.googleUtil;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReadFileUtil {
	private static Logger logger = LoggerFactory.getLogger(ReadFileUtil.class);
	public void creatrStoredCredentialData() {
		File file = null;
		try {
			String fileName = "app/target/StoredCredential";
			file = new File(fileName);
			if (!file.exists()) {
				file.createNewFile();
				file.canWrite();
			}
			logger.info("fileName = {}",file.getAbsolutePath());
			Path path = Paths.get(file.getPath());
			Files.copy(ReadFileUtil.class.getResourceAsStream("/StoredCredential"), path,
					StandardCopyOption.REPLACE_EXISTING);
		} catch (Exception e) {
			e.printStackTrace();
		}

	};
}
