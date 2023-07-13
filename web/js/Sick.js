function DeleteSick(patientID, sickID) {
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
        xhr.send('patientID=' + encodeURIComponent(patientID) + '&sickID=' + encodeURIComponent(sickID));
    }
}
function ReviseSick(patientID, sickID) {
    window.location.href = "SickInformation.jsp?patientID=" + patientID + "&sickID=" + sickID;
}
function goBack() {
    history.back();
}