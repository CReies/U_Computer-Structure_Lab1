.data
prompt1:
.asciiz "Ingrese el primer número: "
prompt2:
.asciiz "Ingrese el segundo número: "
prompt3:
.asciiz "Ingrese el tercer número: "
result:
.asciiz "El número mayor es: "
newline:
.asciiz "\n"

.text
main:
# Solicitar al usuario que ingrese el primer número
  li $v0, 4
  la $a0, prompt1
  syscall

# Leer el primer número
  li $v0, 5
  syscall
  move $t0, $v0

# Solicitar al usuario que ingrese el segundo n�mero
  li $v0, 4
  la $a0, prompt2
  syscall

# Leer el segundo n�mero
  li $v0, 5
  syscall
  move $t1, $v0

# Solicitar al usuario que ingrese el tercer n�mero
  li $v0, 4
  la $a0, prompt3
  syscall

# Leer el tercer n�mero
  li $v0, 5
  syscall
  move $t2, $v0

# Comparar los n�meros para encontrar el mayor
  slt $t4, $t0, $t1 # Comparar el primer n�mero con el segundo
  movn $t0, $t1, $t4 # Si el segundo n�mero es mayor, copiarlo en $t0
  slt $t4, $t0, $t2 # Comparar el m�ximo actual con el tercer n�mero
  movn $t0, $t2, $t4 # Si el tercer n�mero es mayor, copiarlo en $t0

# Imprimir el resultado
  li $v0, 4
  la $a0, result
  syscall

# Imprimir el n�mero mayor
  move $a0, $t0
  li $v0, 1
  syscall

# Imprimir un salto de l�nea
  li $v0, 4
  la $a0, newline
  syscall

# Salir del programa
  li $v0, 10
  syscall
