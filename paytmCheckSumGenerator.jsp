<%@page import="com.google.gson.GsonBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.google.gson.Gson"%>
<%@ page import="java.util.*,
				java.net.URLEncoder,
				com.paytm.merchant.CheckSumServiceHelper"%>
<%

Map<String, String[]> map = request.getParameterMap();
        Set<Map.Entry<String, String[]>> entrySet = map.entrySet();

        TreeMap<String,String> parameters = new TreeMap<>();
        String paytmChecksum =  "";

        for (Map.Entry<String, String[]> entry : entrySet) {
            parameters.put(entry.getKey(), entry.getValue()[0]);
        }

String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum("PAYTM MERCHANT KEY", parameters);
parameters.put("CHECKSUMHASH",checkSum);
parameters.put("payt_STATUS","1");
Gson gson = new GsonBuilder().disableHtmlEscaping().create();
out.println(gson.toJson(parameters));

%>
