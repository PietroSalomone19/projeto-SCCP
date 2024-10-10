-- CREATE ALUNO - TRIGGER - FUNCTION
CREATE SEQUENCE seq_ra START 1;

CREATE TABLE Aluno (
    id_aluno SERIAL PRIMARY KEY,
    ra VARCHAR (7) UNIQUE NOT NULL,
    nome VARCHAR (80) NOT NULL,
    sobrenome VARCHAR (80) NOT NULL,
    data_nascimento DATE,
    endereco VARCHAR (200),
    email VARCHAR (80),
    celular VARCHAR (20) NOT NULL
);

CREATE OR REPLACE FUNCTION gerar_ra() RETURNS TRIGGER AS $$
BEGIN
    NEW.ra := 'AAA' || TO_CHAR(nextval('seq_ra'), 'FM0000');
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_gerar_ra
BEFORE INSERT ON Aluno
FOR EACH ROW EXECUTE FUNCTION gerar_ra();


-- CREATE LIVRO
CREATE TABLE Livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR (200) NOT NULL,
    autor VARCHAR (150) NOT NULL,
    editora VARCHAR (100) NOT NULL,
    ano_publicacao VARCHAR (5),
    isbn VARCHAR (20),
    quant_total INTEGER NOT NULL,
    quant_disponivel INTEGER NOT NULL,
    valor_aquisicao DECIMAL (10,2),
    status_livro_emprestado VARCHAR (20)
);


-- CREATE EMPRESTIMO
CREATE TABLE Emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    id_aluno INT REFERENCES Aluno(id_aluno),
    id_livro INT REFERENCES Livro(id_livro),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR (20)
);


-- ALUNO
INSERT INTO Aluno (nome, sobrenome, data_nascimento, endereco, email, celular) 
VALUES 
('Conor', 'McGregor', '2005-01-15', 'Rua UFC, 123', 'mcgregor@ufc.com', '16998959876'),
('Amanda', 'Nunes', '2004-03-22', 'Rua UFC, 456', 'amanda.nunes@ufc.com', '16995992305'),
('Angelina', 'Jolie', '2003-07-10', 'Rua Hollywood, 789', 'jolie@cinema.com', '16991915502'),
('Natalie', 'Portman', '2002-11-05', 'Rua Hollywood, 101', 'natalie.portman@cinema.com', '16993930703'),
('Shaquille', 'ONeal', '2004-09-18', 'Rua NBA, 202', 'shaquille@gmail.com', '16993937030'),
('Harry', 'Kane', '2000-05-18', 'Rua Futebol, 2024', 'kane@futi.com', '16998951983'),
('Jaqueline', 'Carvalho', '2001-12-10', 'Rua Volei, 456', 'jack@volei.com', '16991993575'),
('Sheilla', 'Castro', '2003-04-25', 'Rua Volei, 2028', 'sheilla.castro@volei.com', '16981974547'),
('Gabriela', 'Guimarães', '2007-08-19', 'Rua Volei, 2028', 'gaby@volei.com', '16983932215'),
('Magic', 'Johnson', '2003-07-08', 'Rua NBA, 1999', 'magic@gmail.com', '16993932020');

INSERT INTO Aluno (nome, sobrenome, data_nascimento, endereco, email, celular) 
VALUES 
('Lionel', 'Messi', '1987-06-24', 'Rua Futebol, 300', 'messi@futebol.com', '16991944821'),
('Neymar', 'Júnior', '1992-02-05', 'Rua Futebol, 888', 'neymar@futebol.com', '16985967234'),
('Memphis', 'Depay', '1994-02-13', 'Rua Futebol, 1234', 'memphis@futebol.com', '16984905678'),
('Emma', 'Stone', '1988-11-06', 'Rua Filmes, 567', 'emma@filmes.com', '16983920122'),
('LeBron', 'James', '1984-12-30', 'Rua NBA, 444', 'lebron@nba.com', '16985912345'),
('Scarlett', 'Johansson', '1984-11-22', 'Rua Cinema, 4567', 'scarlett@cinema.com', '16982934567'),
('David', 'Bowie', '1947-01-08', 'Rua Música, 789', 'david@musica.com', '16987956789'),
('Yuri', 'Alberto', '2001-03-18', 'Rua Futebol, 1011', 'yuri@futebol.com', '16981923456'),
('Chris', 'Evans', '1981-06-13', 'Rua Cinema, 222', 'chris@cinema.com', '16982967890'),
('Rihanna', 'Fenty', '1988-02-20', 'Rua Música, 333', 'rihanna@musica.com', '16986934512');

-- LIVRO
INSERT INTO Livro (titulo, autor, editora, ano_publicacao, isbn, quant_total, quant_disponivel, valor_aquisicao, status_livro_emprestado) 
VALUES 
('O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', '1954', '978-0007525546', 10, 10, 150.00, 'Disponível'),
('1984', 'George Orwell', 'Companhia das Letras', '1949', '978-8535906770', 8, 8, 90.00, 'Disponível'),
('Dom Quixote', 'Miguel de Cervantes', 'Penguin Classics', '1605', '978-0142437230', 6, 6, 120.00, 'Disponível'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Agir', '1943', '978-8522008731', 12, 12, 50.00, 'Disponível'),
('A Revolução dos Bichos', 'George Orwell', 'Penguin', '1945', '978-0141036137', 7, 7, 80.00, 'Disponível'),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', '1937', '978-0007458424', 9, 9, 140.00, 'Disponível'),
('O Conde de Monte Cristo', 'Alexandre Dumas', 'Penguin Classics', '1844', '978-0140449266', 5, 5, 110.00, 'Disponível'),
('Orgulho e Preconceito', 'Jane Austen', 'Penguin Classics', '1813', '978-0141439518', 7, 7, 90.00, 'Disponível'),
('Moby Dick', 'Herman Melville', 'Penguin Classics', '1851', '978-0142437247', 4, 4, 100.00, 'Disponível'),
('Guerra e Paz', 'Liev Tolstói', 'Companhia das Letras', '1869', '978-8535922343', 3, 3, 130.00, 'Disponível');

INSERT INTO Livro (titulo, autor, editora, ano_publicacao, isbn, quant_total, quant_disponivel, valor_aquisicao, status_livro_emprestado) 
VALUES 
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 'Rocco', '1997', '978-8532510110', 10, 10, 150.00, 'Disponível'),
('A Menina que Roubava Livros', 'Markus Zusak', 'Intrínseca', '2005', '978-8580571171', 8, 8, 90.00, 'Disponível'),
('A Guerra dos Tronos', 'George R.R. Martin', 'Leya', '1996', '978-8544101983', 6, 6, 120.00, 'Disponível'),
('O Alquimista', 'Paulo Coelho', 'Rocco', '1988', '978-8573023816', 12, 12, 50.00, 'Disponível'),
('O Caçador de Pipas', 'Khaled Hosseini', 'Nova Fronteira', '2003', '978-8576792821', 7, 7, 80.00, 'Disponível'),
('O Hobbit', 'J.R.R. Tolkien', 'HarperCollins', '1937', '978-0007458424', 9, 9, 140.00, 'Disponível'),
('O Retrato de Dorian Gray', 'Oscar Wilde', 'Penguin Classics', '1890', '978-0141442464', 5, 5, 110.00, 'Disponível'),
('Anna Karênina', 'Liev Tolstói', 'Companhia das Letras', '1877', '978-8535922466', 7, 7, 90.00, 'Disponível'),
('O Sol é Para Todos', 'Harper Lee', 'J. R. Scortecci', '1960', '978-8503004359', 4, 4, 100.00, 'Disponível'),
('Crime e Castigo', 'Fiódor Dostoiévski', 'Companhia das Letras', '1866', '978-8535916939', 3, 3, 130.00, 'Disponível');

-- EMPRÉSTIMO
INSERT INTO Emprestimo (id_aluno, id_livro, data_emprestimo, data_devolucao, status_emprestimo) 
VALUES 
(1, 2, '2024-09-01', '2024-09-15', 'Em andamento'),
(2, 1, '2024-09-02', '2024-09-16', 'Em andamento'),
(3, 5, '2024-09-03', '2024-09-17', 'Em andamento'),
(5, 3, '2024-09-04', '2024-09-18', 'Em andamento'),
(4, 6, '2024-09-05', '2024-09-19', 'Em andamento'),
(6, 4, '2024-09-06', '2024-09-20', 'Em andamento'),
(7, 8, '2024-09-07', '2024-09-21', 'Em andamento'),
(8, 7, '2024-09-08', '2024-09-22', 'Em andamento'),
(10, 9, '2024-09-09', '2024-09-23', 'Em andamento'),
(9, 10, '2024-09-10', '2024-09-24', 'Em andamento'),
(1, 10, '2024-09-11', '2024-09-25', 'Em andamento'),
(2, 3, '2024-09-11', '2024-09-25', 'Em andamento'),
(4, 5, '2024-09-11', '2024-09-25', 'Em andamento'),
(6, 2, '2024-09-11', '2024-09-25', 'Em andamento');

INSERT INTO Emprestimo (id_aluno, id_livro, data_emprestimo, data_devolucao, status_emprestimo) 
VALUES 
(1, 5, '2024-09-01', '2024-09-15', 'Em andamento'),
(2, 3, '2024-09-02', '2024-09-16', 'Em andamento'),
(3, 7, '2024-09-03', '2024-09-17', 'Em andamento'),
(5, 9, '2024-09-04', '2024-09-18', 'Em andamento'),
(4, 2, '2024-09-05', '2024-09-19', 'Em andamento'), 
(6, 4, '2024-09-06', '2024-09-20', 'Em andamento'),
(7, 1, '2024-09-07', '2024-09-21', 'Em andamento'),
(8, 8, '2024-09-08', '2024-09-22', 'Em andamento'),
(10, 10, '2024-09-09', '2024-09-23', 'Em andamento'),
(9, 6, '2024-09-10', '2024-09-24', 'Em andamento');