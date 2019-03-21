<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>A Tribute to Squirrel Cigar Parties</title>
    <c:url value="/css/squirrelCigar.css" var="cssHref" />
    <link rel="stylesheet" href="${cssHref}">
</head>

<body>
    <header>
    	<c:url value="/" var="homePageHref" />
    	<c:url value="/images/party.png" var="logoSrc" />
        <a href="${homePageHref}">
       		<img class="party" src="${logoSrc}" />
        </a>
        <h1>Don't be a Squirrel Cigar Party Dummy!</h1>
        <h2>Read the reviews below and then drop one of your own.</h2>
    </header>
	<c:url value="/newSquirrelReview" var="postURL"/>
	<a href="${postURL}">
	<button class="drop" type="button">Drop A Review</button>
	</a>
	<div class="posts">
		<c:forEach var="review" items="${reviews}">
			<div class="reviews">
				<h3>${review.title}</h3>
				<h4>${review.rating}<c:url value="/images/file-hot-star-logo-3.png" var="star" />
   					<img class="star" src="${star}" /></h4>
				<h5>by: ${review.username} on: ${review.dateSubmitted}</h5>
				<p class="message">${review.text}</p>				
			</div>
		</c:forEach>
	</div> 
    <c:url value="/images/forDummies.png" var="dummies" />
   	<img class="book" src="${dummies}" />
</body>
	

