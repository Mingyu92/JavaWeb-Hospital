// 获取画布元素和上下文
const canvas = document.getElementById('patternCanvas');
const ctx = canvas.getContext('2d');

// 绘制圆形
ctx.beginPath();
ctx.arc(canvas.width / 2, canvas.height / 2, 30, 0, 2 * Math.PI);
ctx.fillStyle = 'lightblue'; // 可以更改颜色
ctx.fill();

// // 绘制正方形
// ctx.beginPath();
// const squareSize = 50;
// const squareX = (canvas.width - squareSize) / 2;
// const squareY = (canvas.height - squareSize) / 2;
// ctx.rect(squareX, squareY, squareSize, squareSize);
// ctx.fillStyle = 'red'; // 可以更改颜色
// ctx.fill();

// 添加点击事件监听器
canvas.addEventListener('click', function() {
    window.open('https://www.example.com', '_blank');
});