module.exports = (sequelize, Sequelize) => {
  const Cliente = sequelize.define("cliente", {
    correo: {
      type: Sequelize.STRING(100)
    },
    contrasenna: {
      type: Sequelize.STRING(50)
    },
    nombre: {
      type: Sequelize.STRING(100)
    },
    genero: {
      type: Sequelize.STRING(1)
    },
    tipo_documento: {
      type: Sequelize.STRING(3)
    },
    numero_documento: {
      type: Sequelize.STRING(15)
    },
    fecha_nacimiento: {
      type: Sequelize.DATEONLY
    },
    direccion: {
      type: Sequelize.STRING(100)
    },
    facebook_vinculado: {
      type: Sequelize.STRING(50)
    },
    correo_vinculado: {
      type: Sequelize.STRING(50)
    }
  });

  return Cliente;
};