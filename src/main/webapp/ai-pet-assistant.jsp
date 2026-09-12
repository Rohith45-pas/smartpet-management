<%@ page import="java.util.List" %>
<%@ page import="com.smartpet.model.*" %>
<%@ page import="com.smartpet.dao.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setCharacterEncoding("UTF-8"); %>
<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AI Pet Assistant</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f2f7f5;
        }

        .header {
            background: #198754;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 90%;
            max-width: 900px;
            margin: 30px auto;
        }

        .intro {
            background: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 20px;
            text-align: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .chat-box {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .message {
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
        }

        .assistant {
            background: #e8f5e9;
        }

        .user {
            background: #e3f2fd;
            text-align: right;
        }

        .input-area {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .input-area input {
            flex: 1;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .input-area button {
            padding: 12px 20px;
            border: none;
            background: #198754;
            color: white;
            border-radius: 6px;
            cursor: pointer;
        }

        .input-area button:hover {
            background: #146c43;
        }

        .warning {
            margin-top: 20px;
            padding: 15px;
            background: #fff3cd;
            border-radius: 8px;
            color: #664d03;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #198754;
        }
    </style>
    <link rel="stylesheet" href="smartpet.css">
</head>

<body>
<nav class="site-nav">
  <a class="brand" href="dashboard.jsp">🐾 SmartPet</a>
  <div class="links">
    <a href="dashboard.jsp">🏠 Dashboard</a>
    <a href="my-pets.jsp">🐶 Pets</a>
    <a href="appointments.jsp">📅 Appointments</a>
    <a href="medicines.jsp">💊 Medicines</a>
    <a href="ai-pet-assistant.jsp">🤖 AI Assistant</a>
    <a class="logout" href="LogoutServlet">🚪 Logout</a>
  </div>
</nav>


<div class="header">
    <h1>🤖🐾 AI Pet Assistant</h1>
    <p>Your smart companion for general pet-care guidance</p>
</div>
<div class="page-banner" style="background-image:url('https://images.unsplash.com/photo-1552053831-71594a27632d?auto=format&fit=crop&w=1200&q=80')">
  <div class="banner-content">
    <h1>SmartPet Management</h1>
    <p>Smart care, organized records, and happier pets. 🐾</p>
  </div>
</div>


<div class="container">

    <div class="intro">
        <h2>Hello, <%= user.getFullName() %>! 👋</h2>
        <p>
            Ask questions about pet health, nutrition, grooming,
            medicines, vaccinations and daily care.
        </p>
    </div>

    <div class="chat-box">

        <div class="message assistant">
            <strong>🤖 AI Pet Assistant:</strong>
            <p>
                Hello! I can help you with general pet-care information.
                What would you like to know?
            </p>
        </div>

        <div id="chatMessages"></div>

        <div class="input-area">
            <input type="text"
                   id="question"
                   placeholder="Ask about your pet..."
                   onkeypress="handleKeyPress(event)">

            <button onclick="askAssistant()">
                Ask
            </button>
        </div>

        <div class="warning">
            ⚠️ <strong>Important:</strong>
            This AI assistant provides general educational information
            only. It is not a replacement for a qualified veterinarian.
            For serious, worsening or emergency conditions, consult a
            veterinarian immediately.
        </div>

    </div>

    <a href="dashboard.jsp" class="back">
        ← Back to Dashboard
    </a>

</div>

<script>

function handleKeyPress(event) {
    if (event.key === "Enter") {
        askAssistant();
    }
}

function askAssistant() {

    let input = document.getElementById("question");
    let question = input.value.trim();

    if (question === "") {
        return;
    }

    let chat = document.getElementById("chatMessages");

    chat.innerHTML +=
        '<div class="message user">' +
        '<strong>You:</strong><br>' +
        escapeHtml(question) +
        '</div>';

    let answer = getPetCareAnswer(question);

    chat.innerHTML +=
        '<div class="message assistant">' +
        '<strong>🤖 AI Pet Assistant:</strong><br>' +
        answer +
        '</div>';

    input.value = "";

    window.scrollTo(0, document.body.scrollHeight);
}


function getPetCareAnswer(question) {

    let q = question.toLowerCase();

    if (q.includes("food") ||
        q.includes("nutrition") ||
        q.includes("eat")) {

        return "A balanced diet should be appropriate for your pet's species, age, size and health condition. Avoid sudden diet changes and avoid foods that are known to be toxic to pets. For a personalized diet plan, consult a veterinarian.";
    }

    if (q.includes("vaccine") ||
        q.includes("vaccination")) {

        return "Vaccination schedules depend on the species, age, health status and local veterinary recommendations. Keep your pet's vaccination records updated and ask your veterinarian about the next required vaccine.";
    }

    if (q.includes("groom") ||
        q.includes("bath") ||
        q.includes("clean")) {

        return "Regular grooming can help maintain a healthy coat, skin, nails and ears. Grooming frequency depends on the pet's breed, coat type and lifestyle.";
    }

    if (q.includes("medicine") ||
        q.includes("tablet") ||
        q.includes("drug")) {

        return "Do not give human medicines or change a pet's medication dosage without veterinary advice. Medication should be given only according to a veterinarian's instructions.";
    }

    if (q.includes("vomit") ||
        q.includes("vomiting") ||
        q.includes("diarrhea") ||
        q.includes("blood")) {

        return "Vomiting, diarrhea or blood can have many causes. If symptoms are severe, repeated, accompanied by weakness, difficulty breathing, dehydration, pain or other concerning signs, contact a veterinarian promptly.";
    }

    if (q.includes("skin") ||
        q.includes("itch") ||
        q.includes("itching")) {

        return "Skin problems can have several causes, including parasites, allergies and infections. Avoid using human creams or medicines without veterinary advice. A veterinarian can determine the underlying cause.";
    }

    if (q.includes("exercise") ||
        q.includes("walk")) {

        return "Regular age- and breed-appropriate activity can support your pet's physical and mental health. Exercise needs vary considerably between animals.";
    }

    if (q.includes("hello") ||
        q.includes("hi") ||
        q.includes("hey")) {

        return "Hello! 🐾 Ask me about pet nutrition, vaccinations, grooming, medicines, exercise or general pet care.";
    }

    return "I can provide general information about pet health, nutrition, medicines, vaccinations, grooming, exercise and daily care. Please describe your question in more detail. For diagnosis or treatment of a serious condition, consult a qualified veterinarian.";
}


function escapeHtml(text) {

    let div = document.createElement("div");
    div.textContent = text;

    return div.innerHTML;
}

</script>


<footer class="smartpet-footer">🐾 SmartPet Management System <span>•</span> Care • Health • Happiness ❤️</footer>
</body>
</html>