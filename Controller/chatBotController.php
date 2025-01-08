<?php
require 'Model/chatModel.php';

class ChatbotController {
    private $chatModel;

    public function __construct() {
        $this->chatModel = new ChatModel();
    }

    public function index() {

        if (!isset($_SESSION['user'])) {
            header('Location: index.php?page=connexion');
            exit;
        }

        $chatbots = $this->chatModel->getAllChatbots();
        
        if (isset($_GET['chatbot_id'])) {
            $chatbot_id = $_GET['chatbot_id'];
            $_SESSION['user']['chatbot_id'] = $chatbot_id;
            $chatbot = $this->chatModel->getChatbotById($chatbot_id);
            header("Location: index.php?page=chat&chatbot_id=" . $chatbot_id);
            exit;
        } else {
            $chatbot = $chatbots[0]; 
        }

        require_once 'View/ChatBot.php';
    }
}
