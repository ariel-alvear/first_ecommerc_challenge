# README

# Requerimientos:

# 1. extender funcionalidades de tal manera que los productos puedan tener muchas variaciones, por ejemplo, una polera puede tener talla X, M y L a la vez que cada una de ellas puede tener diferentes colores. El cliente es claro en indicarnos que cada una de estas variaciones maneja un stock independiente al resto.

# 2. Categorías pueden tener muchas categorías hijo y solo una categoría padre. Hacer pruebas unitarias de esto.

# 3. deben haber dos funcionalidades específicas: en el catálogo sólo se muestra un producto de cada tipo, esto es, si existe un modelo de zapatilla roja y otra negra, en el catálogo debe aparecer sólo una de ellas, esto implica que debe haber una página de descripción del producto en donde ahí podamos ver y elegir los colores y la talla, si una variación no tiene stock, no se puede comprar. Esto es importante, ya que si todas las variaciones no tienen stock, no debe aparecer en el catálogo principal.

# 4. Hacer diagrama de los modelos.

# 5.  Generar un método o scope en las categorías, de tal forma que entregue una lista de cada categoría padre y otro de sus hijos, y los hijos de sus hijos, en todos los niveles

# 6. Según su diseño, explicar al cliente cómo implementar la lista de productos del catálogo

# 7. Implementar o explicar las modificaciones (si las hay) al modelo OrderItem para que siga funcionando sin que afecte el resto del sistema.

# 8. Nuestro cliente, a último minuto nos solicita que nuestro sistema soporte cupones de dos tipos:
# a) Uno para distribuir en redes sociales (1 cupón lo pueden ocupar muchas personas).
# b) Otro para clientes específicos (1 cupón solo lo puede ocupar un cliente específico)

# Respuestas: 

# 1. Para lograr que las poleras puedan tener tallas y colores en distintas variaciones, debemos crear las tablas Colores, Tallas y Variaciones. Además, debemos pasar los atributos de Producto: 'Stock', 'Price' y 'SKU' a la tabla Variaciones. Lo ideal sería quitar product_id de OrderItem, pero el desafío no nos permite quitar atributos de OrderItem. Por lo que se requiere agregar la variación del producto, con su color y talla en caso de aplicar. Listo.


# 2. Para esto se debe agregar la columna 'category_id' a la tabla Categories, y crear una relación has_many consigo misma para las categorías hijo, y una belongs_to para la categoría padre. Agregamos los test unitarios. Listo.

# 3. Al hacer ajuste en la base de datos se debe modificar el catalogo para lograr esto. Se agrego un método en Application Record para obtener todos los productos que tengan stock. Este método se aplica en el controlador de home#index para así mostrar solo las variaciones que tengan stock. En el home#index se agrega una modificación para obtener desde la primera variación con stock, el color, talla y precio. Listo.

# 4. Gema ERD para esto. Listo.

# 5. Se crearon dos métodos en el modelo Category, uno para traer todos los nombres de categorías hijo y otro para traer el nombre de la categoría padre.

# 6. Se explica en punto 3.

# 7. Se debe agregar la variación con su color, talla y precio unitario a OrderItem para que se mantenga la funcionalidad.

# 8. Para crear ambos cupones se debe crear un modelo 'Cupón', y se debería agregar un campo en el modelo 'OrderItem' que haga referencia a un cupón si se ocupa, se llamaría cupon_id y por defecto sería un campo nil, en caso de utilizar un cupón se agregaría el id.
# También se debe validar con el cliente si una persona puede ocupar dos cupones al mismo tiempo o no.
# a) Para crear el cupón que pueden ocupar muchas personas se debe crear una relación N a N, suponiendo que muchas personas pueden ocupar muchos cupones. Por lo tanto, se debería hacer una tabla intermedia con user_id y cupon_id.
# b) Para los cupones que solo pueden ocupar clientes específicos, se debería crear un modelo cupón que incluya como FK el user_id


