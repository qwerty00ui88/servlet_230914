<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz01</title>
</head>
<body>
	<%! 
		// 1. 1부터 n까지의 합계를 구하는 함수
		// 선언문
		// input: 끝수(n) output: 결과값
		public int sum(int n) {
			int sum = 0;
			for(int i = 1; i <= n; i++) {
				sum += i;
			}
			return sum;
		}
	%>

	<%
		// 2. 점수들의 평균 구하기
		int[] scores = {80, 90, 100, 95, 80};
		int sum = 0;
		for(int i = 0; i < scores.length; i++) {
			sum += scores[i];
		}
		double average = (double)sum / scores.length;

		// 3. 채점 결과
		List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
		int score = 0;
		for(int i = 0; i < scoreList.size(); i++) {
			if(scoreList.get(i).equals("O")) {
				score += 100 / scoreList.size();
			}
		}
	%>
		
	<%
		// 4. 나이 구하기
		String birthDay = "20010820";
		String yearStr = birthDay.substring(0, 4);
		int age = 2023 - Integer.valueOf(yearStr);
	%>
	
	<h1>1부터 50까지의 합은 <%= sum(50) %>입니다.</h1>
	<h1>평균 점수는 <%= average %>입니다.</h1>
	<h1>채점 결과는 <%= score %>점 입니다.</h1>
	<h1><%= birthDay %>의 나이는 <%= age %>세 입니다.</h1>
</body>
</html>