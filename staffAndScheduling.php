<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff and Scheduling</title>
    <style>
        *{
            font-family: Arial, Helvetica, sans-serif;
        }
        header{
        border-top-left-radius: 30px;
        border-top-right-radius: 30px;
        display: flex;
        justify-content: space-between;
        background-color: #752BDF;
        color: white;
        padding: 15px;
        font-family: Arial, Helvetica, sans-serif;
        width: 100%;
    }
    header button {
        height: 100%;
        width: 180px;
    }
    .hehe2{
        background-color: #F5F6FA;
        border: solid;
        margin-top: 5px;
        
        @media (max-width: 950px) {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            flex-wrap: wrap;
        }
    }
    .buttons{
        display: flex;
        flex-direction: column;
        margin: 20px;
    }
    .buttons a{
        text-align: center;
        width: 95%;
        padding: 10px;
        text-decoration: none;
        background-color: white;
        color: black;
        font-size: 2em;
        border: 1px solid;

        @media (max-width:950px) {
            width: 300px;
        }
    }
    .hehe2{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        height: 100%;
        width: 99.6%;
        border: solid #00D89E;

    
    }
    img{
        /* position: relative; */
        margin: 15px;
        width: 15%;
        border-radius: 50%;

        /* @media (max-width: 950px){
            width: 10%;
        } */
    }
    .status{
        display: flex;
        margin: 15px;
        background-color: #F5F6FA;
        height: 100%;
        width: 100%;

        @media (max-width: 950px) {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            flex-wrap: wrap;
            width: 80%;
        }
    }
    .status ul li{
        font-size: 20px;
        font-weight: bold;
    }
    .status ul li::marker{
        color: green;
        font-weight: bold;
        font-size: 20px;
    }
    .stat{
        margin: 15px;
        height: 10%;
        width: 100%;
        background-color: white;
    }
    .stat p{
        margin-left: 15px;
    }
    
    .ull li{
        background-color: white;
        font-size: 20px;
        padding: 5px;
        width: 95%;
        list-style-type: none;
        border: 1px solid;
    }
    .ull{
        width: 90%;
    }
    input{
        width: 85%;
        font-size: 18px;
        padding: 20px;
        border-radius: 30px;
        border: none;
        box-shadow: 1px 1px 4px black;
    }
    form{
        margin-left: 5px;
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        width: 100%;
        gap: 30px;
    }
    
    
    form button{
        cursor: pointer;
        padding: 15px;
        font-size: 18px;
        border: none;
        border-radius: 30px;
        box-shadow: 1px 1px 5px black;
        width: 30%;
    }
    form button:hover{
        background-color: black;
        color: white;
        transition: 0.2s;
    }

    .buttons button{
        border: none;
        background-color: white;
        font-size: 1em;
        padding: 20px;
        font-weight: bold;
        cursor: pointer;
    }
    .buttons button:hover{
        transition: 0.2s;
        box-shadow: 2px 2px 2px black;
    }
    body{
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }
    select{
        font-size: 20px;
        width: 68%;
        border-radius: 30px;
        padding: 8px;
    }
    label{
        font-size: 25px;
        font-family: Arial, Helvetica, sans-serif;
    }
    .topup-content{
        border-radius: 15px;
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
        align-items: center;
        margin: 5px;
        height: 500px;
        width: 550px;
        background-color: #752BDF;
        color: white;
        box-shadow: 3px 3px 1px white;
    }
    .topup-content h1{
        text-align: center;
        font-family: Arial, Helvetica, sans-serif;
    }
    .topup{
        background: rgb(0, 0, 0, 0.8);
        width: 100%;
        height: 100%;
        position: fixed; 
        display: flex;
        justify-content: center;
        align-items: center;
        top: 0;
    }
        /* Your existing CSS */
        @media (max-width: 950px) {
            .hehe2 {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                flex-wrap: wrap;
            }

            .buttons a {
                width: 300px;
            }
        }
    ul a{
        text-decoration: none;
        color: black;
    }
    </style>
</head>
<body>
    <header>
        <h1>Admin Control</h1>
    </header>

    <div class="topup" id="topup" style="display: none;">
        <div class="topup-content">
            <h1>Assign</h1>
            <form action="staffAndScheduling.html" method="post">
                <label for=""><b>Facilities</b></label>
                <select name="Facilities">
                    <option value="">N/A</option>
                    <option value="Radiology">Radiology</option>
                    <option value="Clinical Laboratory">Clinical Laboratory</option>
                    <option value="Cardiac Diagnostic">Cardiac Diagnostic</option>
                </select>
                <label for=""><b>Unit</b></label>
                <select name="Unit">
                    <option value="">N/A</option>
                </select>
                <input type="datetime-local" name="time">
                <button type="button" onclick="submitForm()">Submit</button>
                <button type="button" onclick="cancelPopup()">Cancel</button>
            </form>
        </div>
    </div>

    <div class="hehe2">
        <div class="status">
            <div class="stat">
                <ul>
                    <li>Active</li>
                </ul>
                <h1 style="margin: 15px;">Viktor Greg Lim</h1>
                <p><b>Role</b>: Nurse</p>
                <p><b>Assigned Ward</b>: Building 1</p>
            </div>
            <div class="buttons">
                <button onclick="openPop()">Assign</button>

            </div>
        </div>
        <ul class="ull">
            <a href=""><li>Kerth Nathaniel Canda</li></a>
            <a href=""><li>Danisa Biliran</li></a>
            <a href=""><li>Yvann Neo Capitan</li></a>
            <a href=""><li>Ombre Thirdy Hamsirani</li></a>
            <a href=""><li>Julianna Mikyla Escudero</li></a>
            <a href=""><li>Tappy Galope</li></a>
            <a href=""><li>Viktor Ryan Lim</li></a>
        </ul>
    </div>
    <script>
        function openPop() {
            document.getElementById("topup").style.display = "flex";
        }

        function cancelPopup() {
            document.getElementById("topup").style.display = "none";
        }

        function submitForm() {
            alert("Form submitted!");
        }
    </script>
</body>
</html>
