package ReportPackage;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.http.HttpSession; // Import HttpSession


@WebServlet("/CreateReportServlet")
public class CreateReportServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "reports"; // The directory where uploaded files will be stored
    

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	  // Check if the request is a multipart request
    	if (!ServletFileUpload.isMultipartContent(request)) {
            response.getWriter().println("Error: Form must have enctype=multipart/form-data");
            return;
        }
    	// Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Initialize variables to store form field values and file details
        String rName = null;
        String rDate = null; 
        String rCategory = null;
        String rAuthor = null;
        String rStatus = null;
        String rFilePath = null;
        String rContentType = null;
        String rContentSummary = null;
        String rContent = null;
        int userId = -1; //  userId to a default invalid value when user is not found

        try {
        	  // Parse the request to get file items and form fields
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();
                    //switch statement to assign field values
                    switch (fieldName) {
                        case "rName":
                            rName = fieldValue;
                            break;
                        case "rDate":
                            rDate = fieldValue; 
                            break;
                        case "rCategory":
                            rCategory = fieldValue;
                            break;
                        case "rStatus":
                            rStatus = fieldValue;
                            break;
                        case "rContentSummary":
                            rContentSummary = fieldValue;
                            break;
                        case "rContent":
                            rContent = fieldValue;
                            break;
                    }
                } else {
                	 // This block handles file uploads
                    if (!item.getName().isEmpty()) {
                        String fileName = new File(item.getName()).getName();
                        rFilePath = UPLOAD_DIRECTORY + File.separator + fileName;
                        rContentType = item.getContentType();
                        File uploadedFile = new File(request.getServletContext().getRealPath("/") + UPLOAD_DIRECTORY, fileName);
                        uploadedFile.mkdirs(); 
                        item.write(uploadedFile);
                    }
                }
            }
            
            // Retrieve session attributes for author and user ID
            HttpSession session = request.getSession();
            rAuthor = (String) session.getAttribute("loggedInUsername"); 
            Integer loggedInUserId = (Integer) session.getAttribute("loggedInUserId"); 
            // Check if author or user ID are null or empty, if so, assign default values
            if (rAuthor == null || rAuthor.isEmpty() || loggedInUserId == null) {
                rAuthor = "Anonymous"; 
                userId = -1;
            }
            else{
                userId = loggedInUserId;
            }

            IReportController obj = new ReportServices();
            boolean isTrue = obj.createReport(rName, rDate, rCategory, rAuthor, rStatus, rFilePath, rContentType, rContentSummary, rContent, userId); 
            
         // Check if the report creation was successful or not
            if (isTrue) {
                String alertmsg = "Report Generated Successfully";
                response.getWriter().println("<script> alert(\'" + alertmsg + "\'); window.location.href = \'ViewReportsServlet\' </script>");
            } else {
                response.sendRedirect("error.jsp?message=Failed to generate report");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("error.jsp?message=File upload failed: " + e.getMessage()).forward(request, response);
        }
    }
}
