function DeleteSick(patientID, sickID, A_Name) {
    var confirmation = confirm('是否要删除该预约记录？');
    if (confirmation) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', './SickRemove', true); // 根据实际情况修改Servlet路径
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                console.log(xhr.status);
                if (xhr.status === 200) {
                    alert('删除成功！');
                    window.location.reload(); // 刷新页面
                } else {
                    console.log("NO");
                    alert('删除失败！');
                }
            }
        };
        xhr.send('patientID=' + encodeURIComponent(patientID) + '&sickID=' + encodeURIComponent(sickID) + '&A_Name=' + encodeURIComponent(A_Name));
    }
}
function ReviseSick(patientID, sickID, A_Name) {
    window.location.href = "SickInformation.jsp?patientID=" + patientID + "&sickID=" + sickID + "&A_Name=" + A_Name;
}
function goBack() {
    history.back();
}