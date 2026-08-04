package tags;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.*;

public class DateTag extends SimpleTagSupport {
	
	@Override
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		
		LocalDate date = LocalDate.now();
		
		out.print(date.getMonthValue() + "/");
		out.print(date.getDayOfMonth() + "/");
		out.print(date.getYear());
	}

}
