let fnObj = {};
let reportTmpl = $('#report-template').html();

//view 초기화 
fnObj.initView = function(user) {
    $('.username').text(user.username);

    //fnObj.fn.getLessonReport(user);
};

//이벤트 초기화 
fnObj.initEvent = function(user) {

};

fnObj.fn = {
    // 수업실적조회
    getLessonReport: function(user) {
        let search = fnObj.fn.getData(user);
        $.ajax({
            type: 'GET',
            url: '/api/teacher/performance',
            data: search,
            success: function(res) {
                res.forEach(function(n) {
                    //결과값에서 화면 표시 및 통계처리 필요.
                });

                var html = Mustache.render(reportTmpl, {list: res});
                $('#report-container').html(html);
            },
        });
        return false;
    },
    // 조회조건
    getData: function(user) {
        let storCd = user.storCd;
        let empNo = user.empNo;
        let searchDate = $('#report-year').val() + '' + $('#report-month');

        //관리자인경우 파라미터값 null 처리
        if (user.userLv === '03') {
            empNo = '';
            storCd = '';
        }

        return {
            storCd: storCd,
            empNo: empNo,           //선생님
            schMonth: searchDate,   //조회년월
        };
    },
};

$(function() {
    let user = JSON.parse(window.localStorage.getItem('todays'));
    fnObj.initView(user);
    fnObj.initEvent(user);

    //console.log('max weeks:' + getWeekCountOfMonth('201810'));
    var hp = "01040649971".replace( /(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
    console.log('hp:' + hp);
    
});



