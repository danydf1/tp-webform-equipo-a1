
namespace Dominio
{
    public class Marca
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public override string ToString()
        {
            return Descripcion;
        }

        public override bool Equals(object obj)
        {
            return ((Marca)obj).Id == this.Id;
        }
    }
}
