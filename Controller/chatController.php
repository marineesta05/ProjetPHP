<?php

class ChatController {
    private $chatModel;

    public function __construct() {
        $this->chatModel = new ChatModel();
    }

    public function chat($chatbot_id) {
        if (!isset($_SESSION['user'])) {
            header('Location: index.php?page=connexion');
            exit;
        }
        

        if (!isset($_SESSION['user']['chatbot_id'])) {
            $_SESSION['user']['chatbot_id'] = $chatbot_id;
        }

        $chatbot = $this->chatModel->getChatbotById($chatbot_id);

        if (!$chatbot) {
            header('Location: index.php?page=ChatBot');
            exit;
        }

        $chatHistory = $this->chatModel->getChatHistoryByChatbot($_SESSION['user']['nom'], $chatbot_id) ?? [];

        $message = trim($_POST['message'] ?? '');
        if (!empty($message)) {
            error_log("Caractère du chatbot : " . $chatbot['caractere']);
            $response = $this->chatModel->getResponse($message, $chatbot_id, $chatbot['caractere']);
            $this->chatModel->saveChat($_SESSION['user']['nom'], $message, $response);
            $chatHistory[] = ['message_utilisateur' => $message, 'message_chatbot' => $response];
        }

        $exemples = explode("\n", $chatbot['exemple_phrases'] ?? '');

        require_once 'View/chat.php';
    }
    
}
