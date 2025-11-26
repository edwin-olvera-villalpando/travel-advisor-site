#!/bin/bash

# Travel Advisor Project Kickstarter - Minimal Setup
# This script only sets up React + Vite with basic styling

set -e

echo "🚀 Creating Travel Advisor Project (Minimal Setup)..."

# ============================================
# FRONTEND SETUP (React + Vite)
# ============================================
echo "📦 Setting up frontend with React + Vite..."

# Create Vite React project
npm create vite@latest frontend -- --template react

cd frontend

# Create basic styles
cat > src/App.css << 'EOF'
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', sans-serif;
  background: #f5f5f5;
}

.app {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.app h1 {
  text-align: center;
  margin-bottom: 20px;
  color: #333;
}

.chat-container {
  background: white;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  height: 600px;
  display: flex;
  flex-direction: column;
}

.message-list {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
}

.message {
  margin-bottom: 15px;
  padding: 10px 15px;
  border-radius: 8px;
  max-width: 70%;
}

.message.user {
  background: #007bff;
  color: white;
  margin-left: auto;
}

.message.assistant {
  background: #e9ecef;
  color: #333;
}

.typing-indicator {
  color: #666;
  font-style: italic;
  padding: 10px;
}

.message-input {
  display: flex;
  gap: 10px;
  padding: 20px;
  border-top: 1px solid #e0e0e0;
}

.message-input input {
  flex: 1;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 14px;
}

.message-input input:focus {
  outline: none;
  border-color: #007bff;
}

.message-input button {
  padding: 10px 20px;
  background: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 14px;
  transition: background 0.2s;
}

.message-input button:hover:not(:disabled) {
  background: #0056b3;
}

.message-input button:disabled {
  background: #ccc;
  cursor: not-allowed;
}
EOF

# Update App.jsx with basic structure
cat > src/App.jsx << 'EOF'
import './App.css'

function App() {
  return (
    <div className="app">
      <h1>Travel Advisor</h1>
      <div className="chat-container">
        <div className="message-list">
          <div className="message assistant">
            <div className="message-content">
              Hello! I'm your travel advisor. How can I help you plan your trip today?
            </div>
          </div>
        </div>
        <form className="message-input">
          <input
            type="text"
            placeholder="Ask me about travel plans..."
          />
          <button type="submit">
            Send
          </button>
        </form>
      </div>
    </div>
  )
}

export default App
EOF

cd ..

# ============================================
# BACKEND SETUP (Empty Structure)
# ============================================
echo "📁 Creating backend folder structure..."

mkdir -p backend
cd backend

# Create empty directory structure for you to build
mkdir -p app/{agents,api,models,services,utils,middleware}
mkdir -p tests/{test_agents,test_api}

# Create basic requirements.txt
cat > requirements.txt << 'EOF'
# Add your Python dependencies here
# Examples:
# fastapi
# uvicorn
# openai
# python-dotenv
EOF

# Create .env.example
cat > .env.example << 'EOF'
# Add your environment variables here
# OPENAI_API_KEY=your_key_here
EOF

# Create empty __init__.py files
touch app/__init__.py
touch app/agents/__init__.py
touch app/api/__init__.py
touch app/models/__init__.py
touch app/services/__init__.py
touch app/utils/__init__.py
touch app/middleware/__init__.py
touch tests/__init__.py
touch tests/test_agents/__init__.py
touch tests/test_api/__init__.py

# Create README for backend
cat > README.md << 'EOF'
# Travel Advisor Backend

This is where you'll build your Python backend!

## Suggested Structure

- `app/main.py` - Your FastAPI application entry point
- `app/agents/` - Your OpenAI agents (manager, chatbot, scraper, planner)
- `app/api/` - Your API endpoints
- `app/models/` - Data models
- `app/services/` - Business logic
- `app/utils/` - Helper functions

## Getting Started

1. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

2. Install dependencies:
```bash
pip install fastapi uvicorn openai python-dotenv
pip freeze > requirements.txt
```

3. Create your main.py and start coding!

Good luck! 🚀
EOF

cd ..

# ============================================
# ROOT PROJECT FILES
# ============================================
echo "📝 Creating root project files..."

# Create main README.md
cat > README.md << 'EOF'
# Travel Advisor

A travel planning application with AI-powered agents.

## Project Structure

```
travel-advisor/
├── frontend/          # React + Vite (ready to use!)
└── backend/           # Python backend (empty - build it yourself!)
```

## Frontend Setup (Ready!)

The frontend is set up with React + Vite and basic styling. To start:

```bash
cd frontend
npm install
npm run dev
```

Visit `http://localhost:5173` to see the basic UI.

## Backend Setup (Your Turn!)

The backend folder structure is created for you. Now it's your turn to:

1. Set up FastAPI
2. Create the manager agent
3. Build the specialist agents (chatbot, scraper, planner)
4. Create API endpoints
5. Connect it to the frontend

Suggested first steps:
```bash
cd backend
python -m venv venv
source venv/bin/activate
pip install fastapi uvicorn openai python-dotenv
```

## Architecture Plan

**Frontend (Done!):**
- Single chat interface
- Basic styling included
- Ready to connect to your backend

**Backend (You Build!):**
- Manager Agent: Routes requests to specialists
- Chatbot Agent: General conversation
- Scraper Agent: Real-time travel data
- Planner Agent: Itinerary creation

## Learning Resources

- FastAPI: https://fastapi.tiangolo.com/
- OpenAI Python SDK: https://platform.openai.com/docs/api-reference
- Agent patterns: https://platform.openai.com/docs/guides/function-calling

Happy coding! 🎉
EOF

echo ""
echo "✅ Minimal project structure created successfully!"
echo ""
echo "📋 What's included:"
echo "   ✓ React + Vite frontend with basic chat UI and styling"
echo "   ✓ Empty backend folder structure for you to build"
echo ""
echo "🚀 Next steps:"
echo ""
echo "1. Start the frontend:"
echo "   cd $PROJECT_NAME/frontend"
echo "   npm install"
echo "   npm run dev"
echo ""
echo "2. Build your backend:"
echo "   cd $PROJECT_NAME/backend"
echo "   python -m venv venv"
echo "   source venv/bin/activate"
echo "   pip install fastapi uvicorn openai python-dotenv"
echo "   # Create app/main.py and start coding!"
echo ""
echo "💡 The frontend is ready to go. Now you can learn by building the backend yourself!"
echo ""
echo "🎉 Happy coding and learning!"