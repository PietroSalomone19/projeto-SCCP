/**
 * Classe que representa um aluno.
 */
export class Aluno {

    /* Atributos */
    /* Identificador do aluno */
    private idAluno: number = 0;
    /* ra do aluno */
    private raAluno: string = "";
    /* nome do aluno */
    private nome: string;
    /* sobrenome do aluno */
    private sobrenome: string;
    /* data de nascimento do aluno */
    private dataNascimento: Date;
    /* endereço do aluno */
    private endereco: string;
    /* email do aluno */
    private email: string;
    /* celular do aluno */
    private celular: string;

    /**
     * Construtor da classe Aluno
     * 
     * @param nome Nome do aluno 
     * @param sobrenome Sobrenome do aluno
     * @param dataNascimento data de nascimento do aluno
     * @param endereco Endereço do aluno
     * @param email Email do aluno
     * @param celular Celular do aluno
     */
    constructor(
        nome: string,
        sobrenome: string,
        dataNascimento: Date,
        endereco: string,
        email: string,
        celular: string
    ) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dataNascimento = dataNascimento;
        this.endereco = endereco;
        this.email = email;
        this.celular = celular;
    }

    /* Métodos get e set */
    /**
     * Recupera o identificador do aluno
     * @returns o identificador do aluno
     */
    public getIdAluno(): number {
        return this.idAluno;
    }

    /**
     * Atribui um valor ao identificador do aluno
     * @param idAluno novo identificador do aluno
     */
    public setIdAluno(idAluno: number): void {
        this.idAluno = idAluno;
    }

     /**
     * Recupera o ra do aluno
     * @returns o ra do aluno
     */
     public getRaAluno(): string {
        return this.raAluno;
    }

    /**
     * Atribui um valor ao ra do aluno
     * @param raAluno novo ra do aluno
     */
    public setRaAluno(raAluno: string): void {
        this.raAluno = raAluno;
    }


    /**
     * Retorna o nome do aluno.
     *
     * @returns O nome do aluno.
     */
    public getNome(): string {
        return this.nome;
    }

    /**
     * Define o nome do aluno.
     * 
     * @param nome - O nome do aluno a ser definido.
     */
    public setNome(nome: string): void {
        this.nome = nome;
    }

    /**
     * Retorna o sobrenome do aluno.
     *
     * @returns O sobrenome do aluno.
     */
    public getSobrenome(): string {
        return this.sobrenome;
    }

    /**
     * Define o sobrenome do aluno.
     *
     * @param sobrenome - O sobrenome do aluno.
     */
    public setSobrenome(sobrenome: string): void {
        this.sobrenome = sobrenome;
    }

    /**
  * Retorna a data de nascimento do aluno.
  *
  * @returns A data de nascimento do aluno.
  */
    public getDataNascimento(): Date {
        return this.dataNascimento;
    }

    /**
     * Define a data de nascimento do aluno.
     *
     * @param dataNascimento - A data de nascimento do aluno.
     */
    public setDataNascimento(dataNascimento: Date): void {
        this.dataNascimento = dataNascimento;
    }

    /**
     * Retorna o endereço.
     *
     * @returns O endereço.
     */
    public getEndereco(): string {
        return this.endereco;
    }

    /**
     * Define o endereço.
     *
     * @param endereco - O endereço.
     */
    public setEndereco(endereco: string): void {
        this.endereco = endereco;
    }

    /**
     * Retorna o email.
     *
     * @returns O email.
     */
    public getEmail(): string {
        return this.email;
    }

    /**
     * Define o email.
     *
     * @param email - O email.
     */
    public setEmail(email: string): void {
        this.email = email;
    }

    /**
     * Retorna o número de celular.
     *
     * @returns O número de celular.
     */
    public getCelular(): string {
        return this.celular;
    }

    /**
     * Define o número de celular.
     *
     * @param celular - O número de celular.
     */
    public setCelular(celular: string): void {
        this.celular = celular;
    }
}
