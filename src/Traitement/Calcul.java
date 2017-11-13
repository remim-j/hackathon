package Traitement;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Calcul {
	public static void main(String[] args) {

		try {
			BufferedReader bR = new BufferedReader(new FileReader(new File("resultats_analyses.csv")));
			String line = bR.readLine();
			line = bR.readLine();
			ArrayList<String> alStr = new ArrayList<String>();
			int countLines = 0;
			int countLinesTot = 0;

			while (line != null) {

				String[] lineSplit = line.split(";");
				//System.out.println(line);

				if (lineSplit.length == 12) {

					if (alStr.contains(lineSplit[4]) == false) {
						alStr.add(lineSplit[4]);
					}
					countLines++;
				}
				line = bR.readLine();
				countLinesTot++;
			}

			for (String s : alStr) {

				System.out.println(s);
			}

			System.out.println("Nb : " + alStr.size());
			System.out.println("Nb lignes : " + countLines + " ; Nb tot lignes : " + countLinesTot);

			bR.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
