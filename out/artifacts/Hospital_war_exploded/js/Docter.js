function DeleteDocter(A_Name, hospitalId, departmentId, docterId) {
    var confirmation = confirm('是否要删除该用户？');
    if (confirmation) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './DocterRemove', true); // 根据实际情况修改Servlet路径
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
        xhr.send( '&A_Name=' + encodeURIComponent(A_Name) + 'hospitalId=' + encodeURIComponent(hospitalId) + '&departmentId=' + encodeURIComponent(departmentId) + '&docterId=' + encodeURIComponent(docterId));
    }
}
function goBack() {
    history.back();
}