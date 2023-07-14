function DeletePatient(A_Name, Id) {
    var confirmation = confirm('是否要删除该用户？');
    if (confirmation) {
        var xhr = new XMLHttpRequest();
        var params = 'Id=' + encodeURIComponent(Id) + '&A_Name=' + encodeURIComponent(A_Name); // 添加A_Name作为参数
        xhr.open('POST', './PatientRemove', true); // 根据实际情况修改Servlet路径
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
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
function goBack() {
    history.back();
}