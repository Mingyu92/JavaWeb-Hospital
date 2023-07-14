function DeleteHospital(A_Name, Id) {
    var confirmation = confirm('是否要删除该医院？');
    if (confirmation) {
        var xhr = new XMLHttpRequest();
        var params = 'Id=' + encodeURIComponent(Id) + '&A_Name=' + encodeURIComponent(A_Name); // 添加A_Name作为参数
        console.log("YES");
        xhr.open('POST', './HospitalRemove', true); // 根据实际情况修改Servlet路径
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        console.log("YES");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                console.log(xhr.status);
                if (xhr.status === 200) {
                    console.log("YES1");
                    alert('删除成功！');
                    window.location.reload(); // 刷新页面
                } else {
                    console.log("NO");
                    alert('删除失败！');
                }
            }
        };
        xhr.send(params);
    }
}
function ReviseHospital(A_Name, Id) {
    window.location.href = './HospitalInformation.jsp?Id=' + encodeURIComponent(Id) + '&A_Name=' + encodeURIComponent(A_Name);
}
function goBack() {
    history.back();
}