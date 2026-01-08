while true
    opcion = menu('Seleccione el programa a ejecutar', ...
                  '1. Algoritmo Euclides', ...
                  '2. Coeficientes Bezout', ...
                  '3. Raices Racionales',...
                  '4. Salir');

    switch opcion
        case 1
            diveu;
        case 2
            bezoutpoly;
        case 3
            rrt;
        case 4
            disp('Saliendo del programa.');
            break;
        otherwise
            disp('Opción no válida. Por favor, intente de nuevo.');
    end
end

