class ChatBot {
  String getResponse(String message) {
    if (message.toLowerCase().contains('hi')||message.toLowerCase().contains('hlw')||message.toLowerCase().contains('hello')) {
      return 'Hello! Welcome to WanderHub.How may we help you today?';
    }
    else {
      return 'Wait for a while. We will contact you soon!';
    }
  }
}
