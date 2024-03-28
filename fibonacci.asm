.data
prompt:
.asciiz "Ingrese la cantidad de números de la serie Fibonacci: "
nextnumber:
.asciiz ", "
fib_msg:
.asciiz "Serie de Fibonacci: "

.text
main:
# Solicitar al usuario que ingrese la cantidad de números de la serie Fibonacci
  li $v0, 4
  la $a0, prompt
  syscall

# Leer la cantidad de números ingresados por el usuario
  li $v0, 5
  syscall
  move $t0, $v0 # Almacenar la cantidad en $t0

# Inicializar los primeros dos números de la serie de Fibonacci
  li $t1, 0                 # Primer número de Fibonacci (F(0))
  li $t2, 1                 # Segundo número de Fibonacci (F(1))
  li $t3, 0                 # Cantidad de números impresos

# Imprimir mensaje de la serie de Fibonacci
  li $v0, 4
  la $a0, fib_msg
  syscall

# Imprimir los primeros números de la serie de Fibonacci
  li $t4, 0 # Último número de la serie de fibonacci hasta el momento
  j print_fibonacci

print_fibonacci:
# Verificar si se han impreso suficientes números
  bge $t4, $t0, exit_program

# Imprimir el número de Fibonacci actual
  move $a0, $t1
  li $v0, 1
  syscall
  li $v0, 4
  la $a0, nextnumber
  syscall

# Incrementar el contador de números impresos
  add $t4, $t4, 1 # $t4 = $t4 + 1

# Calcular el siguiente número de Fibonacci
  add $t3, $t1, $t2         # $t3 = $t1 + $t2
  move $t1, $t2             # Mover $t2 a $t1
  move $t2, $t3             # Mover $t3 a $t2

  j print_fibonacci

exit_program:
# Salir del programa
  li $v0, 10
  syscall
