package com.googleUtil;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.sheets.v4.SheetsScopes;

public class GoogleAuthorizeUtil {
	private static Logger logger = LoggerFactory.getLogger(GoogleAuthorizeUtil.class);
	// get client_secret.json
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	// set sheet read or write
	private static final List<String> SCOPES = Arrays.asList(SheetsScopes.SPREADSHEETS);
	private static HttpTransport HTTP_TRANSPORT;
	private static File DATA_STORE_DIR = null;
	private static FileDataStoreFactory DATA_STORE_FACTORY;

	static {
		try {

			DATA_STORE_DIR = new File(GoogleAuthorizeUtil.class.getResource("/").getPath());
			HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
			DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
		} catch (Exception t) {
			t.printStackTrace();
		}
	}

	public static Credential authorize() throws IOException, GeneralSecurityException {

		InputStream in = GoogleAuthorizeUtil.class.getResourceAsStream("/client_secret.json");
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT, JSON_FACTORY,
				clientSecrets, SCOPES).setDataStoreFactory(DATA_STORE_FACTORY).setAccessType("offline").build();
		Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");

		return credential;
	}
}
