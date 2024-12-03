<%@ page import="java.sql.*" %>
<html>
<head><title>Online Examination</title></head>
<body>
    <h1>Online Exam</h1>
    <form action="submitExam.jsp" method="post">
        <%
            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_exam", "root", "james");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM exam_questions");
            

                while (rs.next()) {
        %>
                    <p><%= rs.getString("question") %></p>
                    <input type="radio" name="q<%= rs.getInt("id") %>" value="1"> <%= rs.getString("option1") %><br>
                    <input type="radio" name="q<%= rs.getInt("id") %>" value="2"> <%= rs.getString("option2") %><br>
                    <input type="radio" name="q<%= rs.getInt("id") %>" value="3"> <%= rs.getString("option3") %><br>
                    <input type="radio" name="q<%= rs.getInt("id") %>" value="4"> <%= rs.getString("option4") %><br>
        <%
                }
            
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <br>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
