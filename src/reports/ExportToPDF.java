/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.swing.JEditorPane;
/**
 *
 * @author Savindi
 */
public class ExportToPDF {
    
    public static void export(JEditorPane editorPane, File file) {
        try {
            // Get the content from the JEditorPane
            String htmlContent = editorPane.getText();

            // Create PDF document
            Document document = new Document(PageSize.A4);
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file));
            document.open();

            // Parse HTML content into PDF
            XMLWorkerHelper.getInstance().parseXHtml(
                    writer, document,
                    new ByteArrayInputStream(htmlContent.getBytes())
            );

            document.close();
            System.out.println("PDF created successfully: " + file.getAbsolutePath());
        } catch (IOException | DocumentException e) {
            e.printStackTrace();
        }
    }
    
}
