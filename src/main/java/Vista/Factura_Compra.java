/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Vista;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

/**
 *
 * @author SENA
 */
public class Factura_Compra extends javax.swing.JFrame {

    /**
     * Creates new form Cliente
     */
    public Factura_Compra() {
        initComponents();
    }

    public JTextField getTxtComprobante() {
        return txtComprobante;
    }

    public void setTxtComprobante(JTextField txtComprobante) {
        this.txtComprobante = txtComprobante;
    }

    public JButton getBtnCancelar() {
        return btnCancelar;
    }

    public void setBtnCancelar(JButton btnCancelar) {
        this.btnCancelar = btnCancelar;
    }

    public JLabel getLblTitulo() {
        return lblTitulo;
    }

    public void setLblTitulo(JLabel lblTitulo) {
        this.lblTitulo = lblTitulo;
    }
    
    

    public JTextField getTxtUsuario() {
        return txtUsuario;
    }

    public void setTxtUsuario(JTextField txtUsuario) {
        this.txtUsuario = txtUsuario;
    }

    public JComboBox<String> getCbxtipodepago() {
        return cbxtipodepago;
    }

    public void setCbxtipodepago(JComboBox<String> cbxtipodepago) {
        this.cbxtipodepago = cbxtipodepago;
    }

    
    
    public JButton getBtnGuardarFacturaCompra() {
        return btnGuardarFacturaCompra;
    }

    public void setBtnGuardarFacturaCompra(JButton btnGuardarFacturaCompra) {
        this.btnGuardarFacturaCompra = btnGuardarFacturaCompra;
    }

    public JTextField getTxtProveedor() {
        return txtProveedor;
    }

    public void setTxtProveedor(JTextField txtProveedor) {
        this.txtProveedor = txtProveedor;
    }

    public JPanel getJpFacturaCompra() {
        return jpFacturaCompra;
    }

    public void setJpFacturaCompra(JPanel jpFacturaCompra) {
        this.jpFacturaCompra = jpFacturaCompra;
    }

    
    
    public JButton getBtnBuscarProveedor() {
        return btnBuscarProveedor;
    }

    public void setBtnBuscarProveedor(JButton btnBuscarProveedor) {
        this.btnBuscarProveedor = btnBuscarProveedor;
    }

    public JButton getBtnBuscarUsuario() {
        return btnBuscarUsuario;
    }

    public void setBtnBuscarUsuario(JButton btnBuscarUsuario) {
        this.btnBuscarUsuario = btnBuscarUsuario;
    }
    


    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jpFacturaCompra = new javax.swing.JPanel();
        lblTitulo = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        btnGuardarFacturaCompra = new javax.swing.JButton();
        txtProveedor = new javax.swing.JTextField();
        txtUsuario = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        cbxtipodepago = new javax.swing.JComboBox<>();
        btnBuscarProveedor = new javax.swing.JButton();
        btnBuscarUsuario = new javax.swing.JButton();
        btnCancelar = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        txtComprobante = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jpFacturaCompra.setBackground(new java.awt.Color(255, 255, 0));
        jpFacturaCompra.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        lblTitulo.setFont(new java.awt.Font("Serif", 1, 24)); // NOI18N
        lblTitulo.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblTitulo.setText("NUEVA FACTURA");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 3, 12)); // NOI18N
        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel3.setText("CC del Provedor");

        jLabel4.setFont(new java.awt.Font("Segoe UI", 3, 12)); // NOI18N
        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel4.setText("Identificacion del Usuario:");
        jLabel4.setToolTipText("");

        btnGuardarFacturaCompra.setFont(new java.awt.Font("Segoe UI", 3, 12)); // NOI18N
        btnGuardarFacturaCompra.setText("Guardar");
        btnGuardarFacturaCompra.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnGuardarFacturaCompraActionPerformed(evt);
            }
        });

        txtProveedor.setEditable(false);

        txtUsuario.setEditable(false);
        txtUsuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtUsuarioActionPerformed(evt);
            }
        });

        jLabel9.setFont(new java.awt.Font("Segoe UI", 3, 12)); // NOI18N
        jLabel9.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        jLabel9.setText("Tipo De Pago:");

        cbxtipodepago.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Seleccionar:", "Tarjeta de Credito", "Efectivo" }));

        btnBuscarProveedor.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Filtrar.png"))); // NOI18N

        btnBuscarUsuario.setIcon(new javax.swing.ImageIcon(getClass().getResource("/img/Filtrar.png"))); // NOI18N

        btnCancelar.setFont(new java.awt.Font("Segoe UI", 3, 12)); // NOI18N
        btnCancelar.setText("Cancelar");

        jLabel7.setFont(new java.awt.Font("Segoe UI", 3, 12)); // NOI18N
        jLabel7.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel7.setText("Numero De Comprobante:");
        jLabel7.setToolTipText("");

        txtComprobante.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtComprobanteActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jpFacturaCompraLayout = new javax.swing.GroupLayout(jpFacturaCompra);
        jpFacturaCompra.setLayout(jpFacturaCompraLayout);
        jpFacturaCompraLayout.setHorizontalGroup(
            jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(lblTitulo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(jpFacturaCompraLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpFacturaCompraLayout.createSequentialGroup()
                        .addGap(177, 177, 177)
                        .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(btnBuscarUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jpFacturaCompraLayout.createSequentialGroup()
                                .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(cbxtipodepago, javax.swing.GroupLayout.PREFERRED_SIZE, 228, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(txtProveedor, javax.swing.GroupLayout.PREFERRED_SIZE, 228, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(36, 36, 36)
                                .addComponent(btnBuscarProveedor, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addContainerGap(114, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jpFacturaCompraLayout.createSequentialGroup()
                        .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addGroup(jpFacturaCompraLayout.createSequentialGroup()
                                .addComponent(jLabel7)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(txtComprobante, javax.swing.GroupLayout.PREFERRED_SIZE, 228, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jpFacturaCompraLayout.createSequentialGroup()
                                    .addComponent(jLabel4)
                                    .addGap(22, 22, 22)
                                    .addComponent(txtUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, 228, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addComponent(jLabel3, javax.swing.GroupLayout.Alignment.LEADING)
                                .addComponent(jLabel9, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(173, 173, 173))))
            .addGroup(jpFacturaCompraLayout.createSequentialGroup()
                .addGap(147, 147, 147)
                .addComponent(btnGuardarFacturaCompra, javax.swing.GroupLayout.PREFERRED_SIZE, 110, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(98, 98, 98)
                .addComponent(btnCancelar)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jpFacturaCompraLayout.setVerticalGroup(
            jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jpFacturaCompraLayout.createSequentialGroup()
                .addComponent(lblTitulo, javax.swing.GroupLayout.PREFERRED_SIZE, 67, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel9)
                    .addComponent(cbxtipodepago, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel3)
                        .addComponent(txtProveedor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(btnBuscarProveedor))
                .addGap(39, 39, 39)
                .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel4)
                        .addComponent(txtUsuario, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(btnBuscarUsuario))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 27, Short.MAX_VALUE)
                .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel7)
                    .addComponent(txtComprobante, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(41, 41, 41)
                .addGroup(jpFacturaCompraLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnGuardarFacturaCompra)
                    .addComponent(btnCancelar))
                .addGap(29, 29, 29))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jpFacturaCompra, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jpFacturaCompra, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnGuardarFacturaCompraActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnGuardarFacturaCompraActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnGuardarFacturaCompraActionPerformed

    private void txtUsuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtUsuarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtUsuarioActionPerformed

    private void txtComprobanteActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtComprobanteActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtComprobanteActionPerformed

    /**
     * @param args the command line arguments
     */
    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBuscarProveedor;
    private javax.swing.JButton btnBuscarUsuario;
    private javax.swing.JButton btnCancelar;
    private javax.swing.JButton btnGuardarFacturaCompra;
    private javax.swing.JComboBox<String> cbxtipodepago;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jpFacturaCompra;
    private javax.swing.JLabel lblTitulo;
    private javax.swing.JTextField txtComprobante;
    private javax.swing.JTextField txtProveedor;
    private javax.swing.JTextField txtUsuario;
    // End of variables declaration//GEN-END:variables
}
