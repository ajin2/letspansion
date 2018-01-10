<?xml version="1.0" encoding="euc-kr" ?>
<%@ page contentType="text/xml; charset=euc-kr" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "util.DB" %>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		conn = DB.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from COMMENT2 order by ID");
%>

<result>
	<code>success</code>
	<data><![CDATA[
	[
		<%
		if (rs.next()) {
			do {
				if (rs.getRow() > 1) { %>
					,
					<%
				}
				%>
				{
					am_num : <%=rs.getInt("am_num")%>,
					m_id: '<%=rs.getInt("m_id")%>',
					re_content: '<%=rs.getString("re_content")%>'
				}
				<%
			} while(rs.next());
		}
		%>
	]
	]]></data>
</result>

<%        } catch(Throwable e) {
	out.clearBuffer();
%>

<result>
	<code>error</code>
	<message><![CDATA[<%= e.getMessage() %>]]></message>
</result>

<%        } finally {
if (rs != null) try { rs.close(); } catch(SQLException ex) {}
if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
