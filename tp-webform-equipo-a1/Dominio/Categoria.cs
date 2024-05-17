
namespace Dominio
{
    public class Categoria
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        

        public override string ToString()
        {
            return Descripcion;
        }

        public override bool Equals(object obj)
        {
            return ((Categoria)obj).Id==this.Id;
        }
    }
}
