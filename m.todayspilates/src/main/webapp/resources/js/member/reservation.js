var common = {};

function parse(str) {
    if(!/^(\d){8}$/.test(str)) return "invalid date";
    var y = str.substr(0,4),
        m = str.substr(4,2),
        d = str.substr(6,2);
    return new Date(y,m,d);
}

/**
 * @param {day} day (date type)
 * @return day of week name
 */
function getDayOfWeek(day) {
	if ( day == null ) {
		return '';
	}
	var dat1 = parse(day);
	console.log(dat1);
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[dat1.getDay()];
	return '(' + dayOfWeek + ')';
}

$(document).ready(function() {
	var reservation = $('#reservation-template').html();
	var summary = $('#summary-template').html();
	var user = JSON.parse(window.localStorage.getItem('todays'));
	$('.username').text(user.username);
	
	$.ajax({
		type: 'GET',
		url: '/api/member/reservation',
		data: {storCd: user.storCd, memberNo: user.memberNo},
		success: function(res) {
			res.forEach(function(n) {
				n.dayOfWeek = getDayOfWeek(n.rsvDt);
				n.rsvDt = (n.rsvDt == null) ? '(예약없음)' : n.rsvDt.substr(4, 2) + '.' + n.rsvDt.substr(6, 7);		//mm.dd
				n.rsvTm = (n.rsvTm == null) ? '' : n.rsvTm.substr(0, 2) + ':' + n.rsvTm.substr(2, 3);  // hh:mm
				n.lsnEdDt = (n.lsnEdDt == null) ? '' : ax5.util.date(n.lsnEdDt, {return: 'yyyy-MM-dd'});	// yyyy-mm-dd
			})
			console.log(res);
			var html = Mustache.render(reservation, {list: res});
			$('#reservation-container').append(html);
		}
	});
	
	$.ajax({
		type: 'GET',
		url: '/api/member/lesson/summary',
		data: {storCd: user.storCd, memberNo: user.memberNo},
		success: function(res) {
			var html = Mustache.render(summary, {list: res});
			$('#summary-container').append(html);
			$('#lsnUseSum').text(res[0].lsnUseSum);
			//console.log('memberNo:' + {memberNo})
		}
	});
});

$("#reservation-container").on('click', 'tbody tr', function(e) {
	let lsnCd = $(this).data('id');
	let lsnNm = $(this).find('td').eq(0).text();
	let empNm = $(this).find('td').eq(3).text();
	let user = JSON.parse(window.localStorage.getItem('todays'));
	user.lsnCd = lsnCd;
	user.lsnNm = lsnNm;
	user.empNm = empNm;
	window.localStorage.setItem('todays', JSON.stringify(user));
	
	//goPage('member/reservation-detail');
	goPage('/member/reservation_detail');
});
	
$('#logout').bind('click', function() {

	$.ajax({
		type: 'POST',
		url: '/logout',
		success: function(res) {
			console.log('logout success...');
			
			var protocol = document.location.protocol;
		    var hostname = window.location.hostname;
		    var port = document.location.port;

		    // 식자재 폐기등록 사진파일 업로드용  API PREFIX
		    document_root = protocol + '//' + hostname + ':' + port;
			$(location).attr('href', document_root);
			return false;
		}
	})

});


$('#reservation').bind('click', function() {

	var protocol = document.location.protocol;
    var hostname = window.location.hostname;
    var port = document.location.port;

    // 식자재 폐기등록 사진파일 업로드용  API PREFIX
    var page = protocol + '//' + hostname + ':' + port + '/member/reservation';
	$(location).attr('href', page);
	return false;

});

function goPage(page, params) {
	var protocol = document.location.protocol;
    var hostname = window.location.hostname;
    var port = document.location.port;

    // 식자재 폐기등록 사진파일 업로드용  API PREFIX
    var url = protocol + '//' + hostname + ':' + port + '/' + page;
    //window.location = "news_edit.html?article_id=" + articleId;
	$(location).attr('href', url);
	//return false;
}

