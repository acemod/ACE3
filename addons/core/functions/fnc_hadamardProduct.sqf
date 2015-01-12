/*
 * Author: KoffeinFlummi
 *
 * Returns the Hadamard Product of two vectors.
 * (x hadamard y) = [x1*y1, x2*y2, x3*y3]
 *
 * Arguments:
 * 0: Vector 1
 * 1: Vector 2
 *
 * Return Value:
 * Hadamard Product
 */

_vector1 = _this select 0;
_vector2 = _this select 1;

_newVector = [];

for "_i" from 0 to (((count _vector1) min (count _vector2)) - 1) do {
  _newVector = _newVector + [(_vector1 select _i) * (_vector2 select _i)];
};

_newVector
