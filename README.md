<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UnHax</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Courier New', monospace;
      background-color: #0a0a0a;
      color: #33ff33;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }

    h1 {
      font-size: 3em;
      margin-bottom: 0.5em;
      animation: glitch 1s infinite;
    }

    p {
      font-size: 1.2em;
    }

    @keyframes glitch {
      0% { text-shadow: 2px 2px #ff0000; }
      25% { text-shadow: -2px -2px #00ffff; }
      50% { text-shadow: 2px -2px #ff00ff; }
      75% { text-shadow: -2px 2px #00ff00; }
      100% { text-shadow: 2px 2px #ff0000; }
    }

    .button {
      margin-top: 2rem;
      padding: 12px 24px;
      background: transparent;
      border: 2px solid #33ff33;
      color: #33ff33;
      cursor: pointer;
      font-size: 1em;
      transition: 0.3s;
    }

    .button:hover {
      background-color: #33ff33;
      color: #000;
    }
  </style>
</head>
<body>
  <h1>UnHax</h1>
  <p>Welcome to the future of hacking, ethically.</p>
  <button class="button" onclick="alert('Coming soon: tools, downloads, and more!')">Explore</button>
</body>
</html>
