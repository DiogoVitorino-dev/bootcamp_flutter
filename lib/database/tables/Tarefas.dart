String create_tarefas() {
  return
     '''CREATE tarefas {
		id INT PRIMARY KEY AUTOINCREMENT,
		descricao:TEXT,
		concluido:INTERGER
	};''';
}

