package org.zerock.ga;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.analyticsreporting.v4.AnalyticsReporting;
import com.google.api.services.analyticsreporting.v4.AnalyticsReportingScopes;
import com.google.api.services.analyticsreporting.v4.model.DateRange;
import com.google.api.services.analyticsreporting.v4.model.Dimension;
import com.google.api.services.analyticsreporting.v4.model.GetReportsRequest;
import com.google.api.services.analyticsreporting.v4.model.GetReportsResponse;
import com.google.api.services.analyticsreporting.v4.model.Metric;
import com.google.api.services.analyticsreporting.v4.model.OrderBy;
import com.google.api.services.analyticsreporting.v4.model.Report;
import com.google.api.services.analyticsreporting.v4.model.ReportRequest;
import com.google.api.services.analyticsreporting.v4.model.ReportRow;

@SuppressWarnings("deprecation")
public class HelloAnalyticsReporting {
  private static final String APPLICATION_NAME = "Hello Analytics Reporting";
  private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
  static String path = HelloAnalyticsReporting.class.getResource("").getPath();
  private static final String KEY_FILE_LOCATION = "C:\\myworkspace\\java\\team-main\\src\\main\\java\\org\\zerock\\ga/macro-market-322105-46acce13dd6d.json";
  private static final String VIEW_ID = "248683561";
  public static List<ReportRow> main(Map<String, Object> params) {
	  
	  List<ReportRow> rows = null;
    try {
      //인증
      AnalyticsReporting service = initializeAnalyticsReporting();
	  //매트릭스 디멘션 등등 적용
      GetReportsResponse response = getReport(service,params);
      //결과값
      rows = printResponse(response);
      
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    //가져온 결과값을 컨트롤러로 리턴
    return rows;
  }

  /**
   * Initializes an Analytics Reporting API V4 service object.
   *
   * @return An authorized Analytics Reporting API V4 service object.
   * @throws IOException
   * @throws GeneralSecurityException
   */
  private static AnalyticsReporting initializeAnalyticsReporting() throws GeneralSecurityException, IOException {

    HttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
    GoogleCredential credential = null;
    try{
    	credential = GoogleCredential
                .fromStream(new FileInputStream(KEY_FILE_LOCATION))
                .createScoped(AnalyticsReportingScopes.all());
    }catch(IOException e){
    	System.out.println(e);
    }finally {
    }
    

    // Construct the Analytics Reporting service object.
    return new AnalyticsReporting.Builder(httpTransport, JSON_FACTORY, credential)
        .setApplicationName(APPLICATION_NAME).build();
  }

  /**
   * Queries the Analytics Reporting API V4.
   *
   * @param service An authorized Analytics Reporting API V4 service object.
   * @return GetReportResponse The Analytics Reporting API V4 response.
   * @throws IOException
   */
  @SuppressWarnings("null")
private static GetReportsResponse getReport(AnalyticsReporting service, Map<String, Object> params) throws IOException {
    // Create the DateRange object.
    DateRange dateRange = new DateRange();
    dateRange.setStartDate((String) params.get("startDate"));
    dateRange.setEndDate((String) params.get("endDate"));

    // Create the Metrics object.
    Metric sessions = new Metric()
        .setExpression((String) params.get("metrics"));

    Dimension pageTitle = new Dimension().setName((String) params.get("dimensions"));
    
    List<OrderBy> orderBys= null;
    
    if(params.get("fieldName")!=null) {
    	orderBys= new ArrayList<>();
    	OrderBy orderBy= new OrderBy().setFieldName((String) params.get("fieldName")).setSortOrder((String) params.get("sortOrder")).setOrderType((String)params.get("orderType"));
    	orderBys.add(orderBy);
    }
    
    // Create the ReportRequest object.
    
	ReportRequest request = new ReportRequest()
        .setViewId(VIEW_ID)
        .setDateRanges(Arrays.asList(dateRange))
        .setMetrics(Arrays.asList(sessions))
        .setDimensions(Arrays.asList(pageTitle))
        .setFiltersExpression((String) params.get("filter"))
        .setIncludeEmptyRows(true)
        .setOrderBys(orderBys);

    ArrayList<ReportRequest> requests = new ArrayList<ReportRequest>();
    requests.add(request);

    // Create the GetReportsRequest object.
    GetReportsRequest getReport = new GetReportsRequest()
        .setReportRequests(requests);

    // Call the batchGet method.
    GetReportsResponse response = service.reports().batchGet(getReport).execute();

    // Return the response.
    return response;
  }

  /**
   * Parses and prints the Analytics Reporting API V4 response.
   *
   * @param response An Analytics Reporting API V4 response.
 * @return 
   */
  private static List<ReportRow> printResponse(GetReportsResponse response) {

    for (Report report: response.getReports()) {
      List<ReportRow> rows = report.getData().getRows();

      	return rows;
    }
	return null;
  }
}
