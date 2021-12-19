<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <title>BooStore: API</title>
    <style>
        .container {
            align-items: center;
            display: flex;
            flex-direction: column;
            font-family: sans-serif;
        }

        .container h3 {
            color: #ff9a00;
            border: 1px solid #c98e0b;
            padding: 15px 10px;
        }

        .container p {}

        .container ul {
            list-style: none;
        }

        .container ul li {
            display: inline;
            padding: 0px 5px;
        }
    </style>
</head>

<body>
    <div class="container">
        <h3>BooStore: API</h3>
        <p>Backend Bookstore #Laravel #SQLite #Sanctum</p>
        <ul>
            <li><a href="/api/docs">API docs</a></li>
            <li><a href="/log">Logs</a></li>
            <li><a href="">About</a></li>
        </ul>
    </div>
</body>

</html>
