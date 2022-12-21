enum ValidationError {
  required(message: 'Campo obrigatório'),
  invalidEmail(message: 'E-mail inválido'),
  invalidField(message: 'Campo inválido');

  final String message;

  const ValidationError({required this.message});
}
