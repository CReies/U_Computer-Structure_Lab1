.data
prompt1:
.asciiz "Ingrese el primer número: "
prompt2:
.asciiz "Ingrese el segundo número: "
prompt3:
.asciiz "Ingrese el tercer número: "
result:
.asciiz "El número menor es: "
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

# Solicitar al usuario que ingrese el segundo número
  li $v0, 4
  la $a0, prompt2
  syscall

# Leer el segundo número
  li $v0, 5
  syscall
  move $t1, $v0

# Solicitar al usuario que ingrese el tercer número
  li $v0, 4
  la $a0, prompt3
  syscall

# Leer el tercer número
  li $v0, 5
  syscall
  move $t2, $v0

# Comparar los números para encontrar el menor
  slt $t4, $t0, $t1       # Comparar el primer número con el segundo
  movz $t0, $t1, $t4      # Si el segundo número es menor, copiarlo en $t0
  slt $t4, $t0, $t2       # Comparar el mínimo actual con el tercer número
  movz $t0, $t2, $t4      # Si el tercer número es menor, copiarlo en $t0

# Imprimir el resultado
  li $v0, 4
  la $a0, result
  syscall

# Imprimir el número menor
  move $a0, $t0
  li $v0, 1
  syscall

# Imprimir un salto de línea
  li $v0, 4
  la $a0, newline
  syscall

# Salir del programa
  li $v0, 10
  syscall
