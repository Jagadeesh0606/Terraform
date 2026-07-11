#!/bin/bash

yum update -y
yum install -y httpd

systemctl enable httpd
systemctl start httpd

cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terraform Demo</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container">

    <h1>🚀 Welcome to My Static Website</h1>

    <p>
        This website is automatically deployed using
        <strong>Terraform + AWS EC2 + Apache</strong>.
    </p>

    <a href="#" class="btn">Learn More</a>

</div>

<footer>
    <p>Created by Jagadeeswarareddy | AWS DevOps Practice</p>
</footer>

</body>
</html>
EOF

cat <<'EOF' > /var/www/html/style.css
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:linear-gradient(135deg,#4facfe,#00f2fe);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    flex-direction:column;
}

.container{
    background:white;
    width:700px;
    padding:50px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 15px 35px rgba(0,0,0,0.3);
}

.container h1{
    color:#1f2937;
    margin-bottom:20px;
    font-size:42px;
}

.container p{
    color:#555;
    font-size:20px;
    margin-bottom:30px;
}

.btn{
    background:#2563eb;
    color:white;
    padding:15px 35px;
    border-radius:8px;
    text-decoration:none;
    font-size:18px;
    transition:.3s;
}

.btn:hover{
    background:#1d4ed8;
}

footer{
    margin-top:30px;
    color:white;
    font-size:18px;
}
EOF

systemctl restart httpd