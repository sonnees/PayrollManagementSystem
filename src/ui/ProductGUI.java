package ui;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;
import javax.swing.border.LineBorder;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;

import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.SpinnerNumberModel;

import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.ItemEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.awt.event.ActionEvent;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import custom_field.JTextFieldHint;
import model.DetailPRoductionDAO;
import model.ProductDAO;
import entity.Produre;
import entity.TeamProducing;
import entity.Worker;

import javax.swing.ImageIcon;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;

public class ProductGUI extends JFrame implements ActionListener, MouseListener {
//	public ProductGUI() {
//	}

	private static final long serialVersionUID = 1L;
	private JTextField txtIdProduct;
	private JTextField txtNameProduct;
	private JTextField txtIdProcedure;
	private JTextField txtNameProcedure;
	private JTextField txtPriceProcedure;
	private JTextField txtSearchProduct;
	private JTable tblListProduct;
	private JTextField txtSearchProcedure;
	private JTable tblListProcedure;
	private ProductDAO Dao_Product = new ProductDAO();
	private DefaultTableModel dtmProduct;
	private DefaultTableModel dtmListProcedure;
	private JButton btnInsertProcedure;
	private JButton btnInsertProduct;
	private JButton btnSearchIdProduct;
	private JButton btnDeleteProduct;
	private JButton btnUpdateProduct;
	private JButton btnSearchIdProcedure;
	private JButton btnDeleteProcedure;
	private JButton btnUpdateProcedure;
	private List<Produre> ListProcedure = new ArrayList<Produre>();
	private JTable tblProcedure;
	private DefaultTableModel dtmProcedure;
	private JButton btnClean;
	private JButton btnChange;
	private int rowCountTblProcedure = 0;
	private JPanel pnlProcedure;
	private JSpinner spnOrder;
	private JButton btnModal;
	private entity.DetailProduction details = new entity.DetailProduction();
	private DetailPRoductionDAO detailDAO = new DetailPRoductionDAO();
	private String prevState;
	private JComboBox cmbFilterState;

//	public Component getUI() {
	public ProductGUI() {
		setSize(1200, 690);
		getContentPane().setLayout(null);
//		getContentPane().setBackground(new Color(0,140,140));

		JPanel pnlProduct = new JPanel();
//		pnlProduct.setBackground(new Color(0, 140, 140));
		pnlProduct.setBorder(new TitledBorder(new LineBorder(new Color(0, 140, 140)), "S\u1EA3n Ph\u1EA9m", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 140, 140)));
		pnlProduct.setBounds(10, 10, 460, 191);
		getContentPane().add(pnlProduct);
		pnlProduct.setLayout(null);

		JLabel lblIdProduct = new JLabel("Mã sản phẩm:");
		lblIdProduct.setForeground(Color.BLACK);
		lblIdProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblIdProduct.setBounds(37, 35, 87, 13);
		pnlProduct.add(lblIdProduct);

		txtIdProduct = new JTextField();
		txtIdProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		txtIdProduct.setBounds(162, 35, 245, 19);
		pnlProduct.add(txtIdProduct);
		txtIdProduct.setColumns(10);

		JLabel lblNameProduct = new JLabel("Tên sản phẩm:");
		lblNameProduct.setForeground(Color.BLACK);
		lblNameProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNameProduct.setBounds(37, 75, 87, 13);
		pnlProduct.add(lblNameProduct);

		txtNameProduct = new JTextField();
		txtNameProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		txtNameProduct.setColumns(10);
		txtNameProduct.setBounds(162, 75, 245, 19);
		pnlProduct.add(txtNameProduct);
		txtNameProduct.addFocusListener((FocusListener) new FocusListener() {
			public void focusGained(FocusEvent e) {
				if (Dao_Product.searchProductByIdProduct(txtIdProduct.getText()) == null
						&& dtmProcedure.getRowCount() == 0 && txtNameProcedure.getText().isEmpty()
						&& txtPriceProcedure.getText().isEmpty() && !txtIdProduct.getText().isEmpty()) {
					randomIdProcedure();

				}
			}

			public void focusLost(FocusEvent e) {
//	        	 System.out.println("focus lost");
			}
		});

		JLabel lblDetailProduction = new JLabel("Chi Tiết Sản Xuất : ");
		lblDetailProduction.setForeground(Color.BLACK);
		lblDetailProduction.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblDetailProduction.setBounds(37, 115, 115, 13);
		pnlProduct.add(lblDetailProduction);

		btnClean = new JButton("");
		btnClean.setFocusable(false);
		btnClean.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnClean.setIcon(new ImageIcon("images\\Clear-icon.png"));
		btnClean.setBounds(37, 149, 55, 21);
		pnlProduct.add(btnClean);

		pnlProcedure = new JPanel();
//		pnlProcedure.setBackground(new Color(0,140,140));
		pnlProcedure.setBorder(new TitledBorder(new LineBorder(new Color(0, 140, 140)), "Quy tr\u00ECnh", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 140, 140)));
		pnlProcedure.setBounds(513, 10, 485, 191);
		getContentPane().add(pnlProcedure);
		pnlProcedure.setLayout(null);

		JLabel lblIdProcedure = new JLabel("Mã quy trình :");
		lblIdProcedure.setForeground(Color.BLACK);
		lblIdProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblIdProcedure.setBounds(40, 32, 87, 13);
		pnlProcedure.add(lblIdProcedure);

		txtIdProcedure = new JTextField();
		txtIdProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		txtIdProcedure.setColumns(10);
		txtIdProcedure.setBounds(137, 29, 106, 19);
		pnlProcedure.add(txtIdProcedure);
		txtIdProcedure.addFocusListener((FocusListener) new FocusListener() {
			public void focusGained(FocusEvent e) {
//	            System.out.println("focus gained");
				if (btnInsertProcedure.getIcon().toString().equals("images\\Close-2-icon.png")) {
					btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
					btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
				}
			}/* from w ww . j a va2 s. c o m */

			public void focusLost(FocusEvent e) {
//	        	 System.out.println("focus lost");
			}
		});

		JLabel lblNameProcedure = new JLabel("Tên quy trình :");
		lblNameProcedure.setForeground(Color.BLACK);
		lblNameProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNameProcedure.setBounds(40, 70, 87, 13);
		pnlProcedure.add(lblNameProcedure);

		txtNameProcedure = new JTextField();
		txtNameProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		txtNameProcedure.setColumns(10);
		txtNameProcedure.setBounds(137, 67, 130, 19);
		pnlProcedure.add(txtNameProcedure);
		txtNameProcedure.addFocusListener((FocusListener) new FocusListener() {
			public void focusGained(FocusEvent e) {
//	            System.out.println("focus gained");
				if (btnInsertProcedure.getIcon().toString().equals("images\\Close-2-icon.png")) {
					btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
					btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
				}
				else if(txtIdProcedure.getText().isEmpty()) {
					randomIdProcedure();
				}
			}/* from w ww . j a va2 s. c o m */

			public void focusLost(FocusEvent e) {
//	        	 System.out.println("focus lost");
			}
		});

		JLabel lblPriceProcedure = new JLabel("Giá :");
		lblPriceProcedure.setForeground(Color.BLACK);
		lblPriceProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblPriceProcedure.setBounds(294, 32, 30, 13);
		pnlProcedure.add(lblPriceProcedure);

		txtPriceProcedure = new JTextField();
		txtPriceProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		txtPriceProcedure.setColumns(10);
		txtPriceProcedure.setBounds(330, 29, 106, 19);
		pnlProcedure.add(txtPriceProcedure);
		txtPriceProcedure.addFocusListener((FocusListener) new FocusListener() {
			public void focusGained(FocusEvent e) {
//	            System.out.println("focus gained");
				if (btnInsertProcedure.getIcon().toString().equals("images\\Close-2-icon.png")) {
					btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
					btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
				}
				else if(txtIdProcedure.getText().isEmpty()) {
					randomIdProcedure();
				}
			}/* from w ww . j a va2 s. c o m */

			public void focusLost(FocusEvent e) {
//	        	 System.out.println("focus lost");
			}
		});

		btnInsertProcedure = new JButton("");
		btnInsertProcedure.setFocusable(false);
		btnInsertProcedure.setForeground(Color.BLACK);
		btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
		btnInsertProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnInsertProcedure.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnInsertProcedure.setBounds(310, 67, 70, 21);
		pnlProcedure.add(btnInsertProcedure);

		JScrollPane scrProcedure = new JScrollPane();
		scrProcedure.setBounds(40, 93, 396, 88);
		pnlProcedure.add(scrProcedure);

		tblProcedure = new JTable();
		tblProcedure.setBackground(Color.WHITE);
		tblProcedure.setGridColor(new Color(0, 140, 140));
		tblProcedure.setBorder(new LineBorder(new Color(0, 140, 140)));
		tblProcedure.setForeground(Color.BLACK);
		JTableHeader tblHeaderProcedure = tblProcedure.getTableHeader();
		tblHeaderProcedure.setBackground(new Color(14,85,78));
		tblHeaderProcedure.setForeground(Color.WHITE);
		tblProcedure.setModel(dtmProcedure = new DefaultTableModel(new Object[][] {},
				new String[] { "Mã quy trình", "Tên quy trình", "Giá", "Thứ tự" }) {
			private static final long serialVersionUID = 1L;

			public boolean isCellEditable(int rowIndex, int columnIndex) {
				return false;
			}
		});
		tblProcedure.getColumnModel().getColumn(1).setPreferredWidth(152);
		tblProcedure.getColumnModel().getColumn(2).setPreferredWidth(50);
		tblProcedure.getColumnModel().getColumn(3).setPreferredWidth(45);
		tblProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		scrProcedure.setViewportView(tblProcedure);

		btnInsertProduct = new JButton("Thêm sản phẩm");
		btnInsertProduct.setFocusable(false);
		btnInsertProduct.setIcon(new ImageIcon("images\\math-add-icon.png"));
		btnInsertProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnInsertProduct.setBounds(1022, 90, 154, 40);
		getContentPane().add(btnInsertProduct);

		JPanel pnlListProducts = new JPanel();
//		pnlListProducts.setBackground(new Color(0,140,140));
		pnlListProducts.setBounds(0, 211, 1186, 442);
		getContentPane().add(pnlListProducts);
		pnlListProducts.setLayout(null);

		JPanel pnlListProduct = new JPanel();
//		pnlListProduct.setBackground(new Color(0,140,140));
		pnlListProduct.setBorder(new TitledBorder(new LineBorder(new Color(0, 140, 140)), "Danh sách sản phẩm",
				TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 140, 140)));
		pnlListProduct.setBounds(10, 10, 580, 432);
		pnlListProducts.add(pnlListProduct);
		pnlListProduct.setLayout(null);

		JLabel lblNoteIdProduct = new JLabel("Nhập mã SP :");
		lblNoteIdProduct.setForeground(Color.BLACK);
		lblNoteIdProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNoteIdProduct.setBounds(10, 17, 82, 15);
		pnlListProduct.add(lblNoteIdProduct);

		txtSearchProduct = new JTextFieldHint("Nhập mã sản phẩm...");
		txtSearchProduct.setPreferredSize(new Dimension(200, 25));
		txtSearchProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		txtSearchProduct.setColumns(10);
		txtSearchProduct.setBounds(95, 16, 120, 19);
		pnlListProduct.add(txtSearchProduct);

		btnSearchIdProduct = new JButton("");
		btnSearchIdProduct.setFocusable(false);
		btnSearchIdProduct.setIcon(new ImageIcon("images\\Zoom-icon.png"));
		btnSearchIdProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnSearchIdProduct.setBounds(350, 15, 70, 21);
		pnlListProduct.add(btnSearchIdProduct);

		btnDeleteProduct = new JButton("");
		btnDeleteProduct.setFocusable(false);
		btnDeleteProduct.setIcon(new ImageIcon("images\\Close-2-icon.png"));
		btnDeleteProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnDeleteProduct.setBounds(425, 15, 70, 21);
		pnlListProduct.add(btnDeleteProduct);

		btnUpdateProduct = new JButton("");
		btnUpdateProduct.setFocusable(false);
		btnUpdateProduct.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
		btnUpdateProduct.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnUpdateProduct.setBounds(500, 15, 70, 21);
		pnlListProduct.add(btnUpdateProduct);

		JScrollPane scrProduct = new JScrollPane();
		scrProduct.setBounds(10, 57, 560, 365);
		pnlListProduct.add(scrProduct);

		tblListProduct = new JTable();
		tblListProduct.setBackground(Color.WHITE);
		tblListProduct.setForeground(Color.BLACK);
		tblListProduct.setGridColor(new Color(0, 140, 140));
		tblListProduct.setRowHeight(25);
		tblListProduct.setBorder(new LineBorder(new Color(0, 140, 140)));
		JTableHeader tblHeaderListProduct = tblListProduct.getTableHeader();
		tblHeaderListProduct.setBackground(new Color(14,85,78));
		tblHeaderListProduct.setForeground(Color.WHITE);
		tblHeaderListProduct.setPreferredSize(new Dimension(100, 30));
		tblHeaderListProduct.setFont(new Font("Tahoma", Font.BOLD, 12));
		tblListProduct.setModel(dtmProduct = new DefaultTableModel(new Object[][] {},
				new String[] { "Mã sản phẩm", "Tên sản phẩm", "Số lượng" }) {
			private static final long serialVersionUID = 1L;

			public boolean isCellEditable(int rowIndex, int columnIndex) {
				return false;
			}
		});
		scrProduct.setViewportView(tblListProduct);

		JPanel pnlListProcedure = new JPanel();
//		pnlListProcedure.setBackground(new Color(0,140,140));
		pnlListProcedure.setBorder(new TitledBorder(new LineBorder(new Color(0, 140, 140)), "Danh sách quy trình",
				TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 140, 140)));
		pnlListProcedure.setBounds(596, 10, 580, 432);
		pnlListProducts.add(pnlListProcedure);
		pnlListProcedure.setLayout(null);

		JScrollPane scrListProcedure = new JScrollPane();
		scrListProcedure.setBounds(10, 57, 560, 365);
		pnlListProcedure.add(scrListProcedure);

		tblListProcedure = new JTable();
//		tblListProcedure.setBackground(new Color(0,140,140));
		tblListProcedure.setForeground(Color.BLACK);
		tblListProcedure.setGridColor(new Color(0, 140, 140));
		tblListProcedure.setRowHeight(25);
		tblListProcedure.setBorder(new LineBorder(new Color(0, 140, 140)));
		JTableHeader tblHeaderListProcedure = tblListProcedure.getTableHeader();
		tblHeaderListProcedure.setBackground(new Color(14,85,78));
		tblHeaderListProcedure.setForeground(Color.WHITE);
		tblHeaderListProcedure.setPreferredSize(new Dimension(100, 30));
		tblHeaderListProcedure.setFont(new Font("Tahoma", Font.BOLD, 12));
		tblListProcedure.setModel(dtmListProcedure = new DefaultTableModel(new Object[][] {},
				new String[] { "Mã quy trình", "Tên quy trình", "Giá", "Thứ tự" }) {
			private static final long serialVersionUID = 1L;

			public boolean isCellEditable(int rowIndex, int columnIndex) {
				return false;
			}
		});
		tblListProcedure.getColumnModel().getColumn(1).setPreferredWidth(200);
		tblListProcedure.getColumnModel().getColumn(2).setPreferredWidth(50);
		tblListProcedure.getColumnModel().getColumn(3).setPreferredWidth(50);
		scrListProcedure.setViewportView(tblListProcedure);

		JLabel lblNoteIdProcedure = new JLabel("Nhập mã quy trình :");
		lblNoteIdProcedure.setForeground(Color.BLACK);
		lblNoteIdProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		lblNoteIdProcedure.setBounds(25, 19, 118, 15);
		pnlListProcedure.add(lblNoteIdProcedure);

		txtSearchProcedure = new JTextFieldHint("Nhập mã quy trình...");
		txtSearchProcedure.setPreferredSize(new Dimension(200, 25));
		txtSearchProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		txtSearchProcedure.setColumns(10);
		txtSearchProcedure.setBounds(153, 18, 134, 19);
		pnlListProcedure.add(txtSearchProcedure);

		btnSearchIdProcedure = new JButton("");
		btnSearchIdProcedure.setFocusable(false);
		btnSearchIdProcedure.setIcon(new ImageIcon("images\\Zoom-icon.png"));
		btnSearchIdProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnSearchIdProcedure.setBounds(297, 17, 70, 21);
		pnlListProcedure.add(btnSearchIdProcedure);

		btnDeleteProcedure = new JButton("");
		btnDeleteProcedure.setFocusable(false);
		btnDeleteProcedure.setIcon(new ImageIcon("images\\Close-2-icon.png"));
		btnDeleteProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnDeleteProcedure.setBounds(382, 17, 70, 21);
		pnlListProcedure.add(btnDeleteProcedure);

		btnUpdateProcedure = new JButton("");
		btnUpdateProcedure.setFocusable(false);
		btnUpdateProcedure.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
		btnUpdateProcedure.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnUpdateProcedure.setBounds(462, 17, 70, 21);
		pnlListProcedure.add(btnUpdateProcedure);

		btnChange = new JButton("");
		btnChange.setFocusable(false);
		btnChange.setBounds(386, 67, 50, 21);
		pnlProcedure.add(btnChange);
		btnChange.setIcon(new ImageIcon("images\\exchange.png"));
		if (btnInsertProcedure.getIcon().toString().equals("images\\math-add-icon.png")) {
			btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
		} else if (btnInsertProcedure.getIcon().toString().equals("images\\Close-2-icon.png")) {
			btnChange.setIcon(new ImageIcon("images\\exchange.png"));
		}
		btnModal = new JButton("Modal Production");
		btnModal.setFont(new Font("Tahoma", Font.PLAIN, 12));
		btnModal.setBounds(162, 112, 245, 25);
		pnlProduct.add(btnModal);
		txtIdProcedure.setEditable(false);

		spnOrder = new JSpinner();
		spnOrder.setModel(new SpinnerNumberModel(1, 1, 10, 1));
		spnOrder.setBounds(270, 67, 30, 20);
		pnlProcedure.add(spnOrder);
		

		tblListProduct.addMouseListener(this);
		tblListProcedure.addMouseListener(this);
		tblProcedure.addMouseListener(this);
		
		btnClean.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnChange.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnInsertProcedure.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnInsertProduct.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnSearchIdProduct.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnSearchIdProcedure.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnDeleteProduct.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnDeleteProcedure.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnUpdateProduct.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnUpdateProcedure.setBorder(new LineBorder(new Color(14,85,78), 2));
		btnModal.setBorder(new LineBorder(new Color(14,85,78), 2));
		
		btnClean.addActionListener(this);
		btnChange.addActionListener(this);
		btnInsertProcedure.addActionListener(this);
		btnInsertProduct.addActionListener(this);
		btnSearchIdProduct.addActionListener(this);
		btnSearchIdProcedure.addActionListener(this);
		btnDeleteProduct.addActionListener(this);
		btnDeleteProcedure.addActionListener(this);
		btnUpdateProduct.addActionListener(this);
		btnUpdateProcedure.addActionListener(this);
		btnModal.addActionListener(this);

		btnClean.setFocusPainted(false);
		btnChange.setFocusPainted(false);
		btnUpdateProcedure.setFocusPainted(false);
		btnModal.setFocusPainted(false);
		btnInsertProcedure.setFocusPainted(false);
		btnInsertProduct.setFocusPainted(false);
		btnSearchIdProduct.setFocusPainted(false);
		btnSearchIdProcedure.setFocusPainted(false);
		btnDeleteProduct.setFocusPainted(false);
		btnDeleteProcedure.setFocusPainted(false);
		btnUpdateProduct.setFocusPainted(false);
		
		cmbFilterState = new JComboBox();
		cmbFilterState.setFont(new Font("Tahoma", Font.PLAIN, 12));
		cmbFilterState.setModel(new DefaultComboBoxModel(new String[] {"Sản Xuất", "Ngưng Sản Xuất", "Hoàn Thành"}));
		cmbFilterState.setBounds(220, 15, 120, 21);
		pnlListProduct.add(cmbFilterState);
		
		cmbFilterState.addItemListener((ItemEvent e) -> {
			Object item = e.getItem();
			if (e.getStateChange() == ItemEvent.SELECTED) {
				// Item has been selected
				deleteDataOnTableModelProduct();
				if(item.toString().equals("Sản Xuất")) {
					loadListProduct("Sản Xuất");
				}
				else if(item.toString().equals("Ngưng Sản Xuất")) {
					loadListProduct("Ngưng Sản Xuất");
				}
				else{
					loadListProduct("Hoàn Thành");
				}
				
			}
		});
		
		updateQuantityFinish();
		updateStateProduct();
		loadListProduct(cmbFilterState.getSelectedItem().toString());
		loadListProcedure();
		randomIdProduct();
		txtIdProduct.setEditable(false);
		txtIdProcedure.setEditable(false);
		
//		return getContentPane();
	}
	

	public void loadListProduct(String state) {
		List<entity.Product> listProduct;
		listProduct = Dao_Product.getListProduct(state);
		for (entity.Product product : listProduct) {
			addRowProduct(product);
		}
	}
	
	public void updateQuantityFinish() {
		List<entity.Product> listProduct;
		listProduct = Dao_Product.getListProduct("Sản Xuất");
		for (entity.Product product : listProduct) {
			entity.DetailProduction detail = detailDAO.searchDetailProductionById(product.getProductID());
			int quantity = Dao_Product.quantityProductFinish(product.getProductID());
			boolean updateQuantity = detailDAO.updateQuantityFinishDetail(quantity, detail.getDetailProductionID()); 
			
		}
	}
	
	public void updateStateProduct() {
		List<entity.Product> listProduct;
		listProduct = Dao_Product.getListProduct("Sản Xuất");
		for (entity.Product product : listProduct) {
			detailDAO.updateState(product.getProductID());
		}
	}

	public void loadListProcedure() {
		List<Produre> ListProdure;
		ListProdure = Dao_Product.getListProcedure();
		for (Produre qt : ListProdure) {
			addRowListProcedure(qt, dtmListProcedure);
		}
	}

	public void addRowProduct(entity.Product product) {
		entity.DetailProduction detail = detailDAO.searchDetailProductionById(product.getProductID());
		String[] row = { product.getProductID(), product.getName(), detail.getQuantityProduction() + "" };
		dtmProduct.addRow(row);
	}

	public void loadListProcedureByIdProduct(String idProduct, DefaultTableModel dtm) {
		List<Produre> ListProcedure;
		ListProcedure = Dao_Product.getListProcedurebyIdProduct(idProduct);
		for (Produre qt : ListProcedure) {
			addRowListProcedure(qt, dtm);
		}
	}

	public void addRowListProcedure(Produre procedure, DefaultTableModel dtm) {
		String[] row = { procedure.getProcedureID(), procedure.getName(), procedure.getPrice() + "",
				procedure.getNumberOrdinal() + "" };
		dtm.addRow(row);
	}

	public boolean checkProcedureOnTable(String idProcedure) {
		int rowCount = dtmProcedure.getRowCount();
		if (rowCount > 0) {
			for (int i = 0; i < rowCount; i++) {
				if (dtmProcedure.getValueAt(i, 0).toString().equals(idProcedure)) {
					return true;
				}
			}
		}
		return false;
	}

	public void randomIdProduct() {
		int order = (int) (Math.random() * (999 - 1 + 1) + 1);
		String idProduct = "";
		for (int i = 0; i < 2; i++) {
			idProduct += (char) (Math.random() * (90 - 65 + 1) + 65) + "";
		}
		if (order < 10) {
			idProduct += "00" + order;
		} else if (order >= 10 && order <= 99) {
			idProduct += "0" + order;
		} else {
			idProduct += order;
		}

		boolean test = true;
		while (Dao_Product.searchProductByIdProduct(idProduct) == null && test) {
			cleanProduct();
			txtIdProduct.setText(idProduct);
			test = false;
			break;
		}
		if (test) {
			randomIdProduct();
		}
	}
	
	public int createRandomIdDetail() {
		return detailDAO.getOrderDetailPresent() + 1;
	}

	public void randomIdProcedure() {
		int order = (int) (Math.random() * (99 - 1 + 1) + 1);
		String idProcedure = "";
		if (order >= 10) {
			idProcedure = txtIdProduct.getText() + order + "";
		} else {
			idProcedure = txtIdProduct.getText() + "0" + order;
		}

		boolean test = true;
		while (Dao_Product.searchProcedureByIdProcedure(idProcedure) == null && !checkProcedureOnTable(idProcedure)
				&& test) {
			cleanTextFieldProcedure();
			txtIdProcedure.setText(idProcedure);
			test = false;
			break;
		}
		if (test) {
			randomIdProcedure();
		}
	}

	private void deleteDataOnTableModelProduct() {
		dtmProduct.setRowCount(0);
	}

	private void deleteDataOnTableModelProcedure(DefaultTableModel dtm) {
		dtm.setRowCount(0);
	}

	private boolean checkContainProduct(entity.Product product) {
		List<entity.Product> listProduct = Dao_Product.getListProduct(cmbFilterState.getSelectedItem().toString());
		if (listProduct.contains(product)) {
			return true;
		}
		return false;
	}

	public void cleanTextFieldProcedure() {
		txtIdProcedure.setText("");
		txtNameProcedure.setText("");
		txtPriceProcedure.setText("");
	}

	public void cleanProduct() {
		deleteDataOnTableModelProduct();
		deleteDataOnTableModelProcedure(dtmListProcedure);
		deleteDataOnTableModelProcedure(dtmProcedure);
		cleanTextFieldProcedure();
		loadListProduct(cmbFilterState.getSelectedItem().toString());
		loadListProcedure();
		txtNameProduct.requestFocus();
		txtIdProduct.setText("");
		txtNameProduct.setText("");
		btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
		btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
		btnInsertProduct.setIcon(new ImageIcon("images\\math-add-icon.png"));
		btnUpdateProduct.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
		btnInsertProduct.setText("Thêm sản phẩm");
	}

	public void resetProcedure() {
		btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
		btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
		btnUpdateProcedure.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
	}

	public static void main(String[] args) {
		ProductGUI product = new ProductGUI();
		product.setVisible(true);
		
		
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		Object o = e.getSource();
		if (o.equals(tblListProduct)) {
			details = detailDAO.searchDetailProductionById(txtIdProduct.getText());
			deleteDataOnTableModelProcedure(dtmListProcedure);
			deleteDataOnTableModelProcedure(dtmProcedure);
			btnInsertProduct.setText("Thêm sản phẩm");
			btnInsertProduct.setIcon(new ImageIcon("images\\math-add-icon.png"));
			btnUpdateProduct.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
			String idProduct;
			int rowProductSelected = tblListProduct.getSelectedRow();
			idProduct = dtmProduct.getValueAt(rowProductSelected, 0).toString();
			List<Produre> listProcedure = Dao_Product.getListProcedurebyIdProduct(idProduct);
			if (rowProductSelected >= 0 && listProcedure.size() > 0) {
				loadListProcedureByIdProduct(idProduct, dtmListProcedure);
				loadListProcedureByIdProduct(idProduct, dtmProcedure);
				txtIdProduct.setText(dtmProduct.getValueAt(rowProductSelected, 0).toString());
				txtNameProduct.setText(dtmProduct.getValueAt(rowProductSelected, 1).toString());
//				txtQuantityProductive.setText(dtmProduct.getValueAt(rowProductSelected, 2).toString());
				txtIdProcedure.setText(dtmListProcedure.getValueAt(0, 0).toString());
				txtNameProcedure.setText(dtmListProcedure.getValueAt(0, 1).toString());
				txtPriceProcedure.setText(dtmListProcedure.getValueAt(0, 2).toString());
				spnOrder.setValue(Integer.parseInt(dtmListProcedure.getValueAt(0, 3).toString()));
				txtSearchProcedure.setText("");
				resetProcedure();
			} else if (listProcedure.size() <= 0) {
				txtIdProduct.setText(dtmProduct.getValueAt(rowProductSelected, 0).toString());
				txtNameProduct.setText(dtmProduct.getValueAt(rowProductSelected, 1).toString());
//				txtQuantityProductive.setText(dtmProduct.getValueAt(rowProductSelected, 2).toString());
				cleanTextFieldProcedure();
				txtSearchProcedure.setText("");
			}
		} else if (o.equals(tblListProcedure)) {
			details = detailDAO.searchDetailProductionById(txtIdProduct.getText());
			int rowProcedureSelected = tblListProcedure.getSelectedRow();
			int rowProductSelected = tblListProduct.getSelectedRow();
			if (rowProcedureSelected >= 0) {
				resetProcedure();
				txtIdProcedure.setText(dtmListProcedure.getValueAt(rowProcedureSelected, 0).toString());
				txtNameProcedure.setText(dtmListProcedure.getValueAt(rowProcedureSelected, 1).toString());
				txtPriceProcedure.setText(dtmListProcedure.getValueAt(rowProcedureSelected, 2).toString());
				spnOrder.setValue(Integer.parseInt(dtmListProcedure.getValueAt(rowProcedureSelected, 3).toString()));
				Produre procedure = Dao_Product.searchProcedureByIdProcedure(txtIdProcedure.getText());
				entity.Product product = Dao_Product.searchProductByIdProduct(procedure.getProductID());
				txtIdProduct.setText(product.getProductID());
				txtNameProduct.setText(product.getName());
//				txtQuantityProductive.setText(product.getQuantity() + "");
				deleteDataOnTableModelProcedure(dtmProcedure);
				loadListProcedureByIdProduct(txtIdProduct.getText(), dtmProcedure);
				btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
				btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
				if (rowProductSelected >= 0 && txtSearchProcedure.getText().compareToIgnoreCase("ALL") == 0) {
					tblListProduct.removeRowSelectionInterval(rowProductSelected, rowProductSelected);
				}
			}
		} else if (o.equals(tblProcedure)) {
			int rowQTrinhSelected = tblProcedure.getSelectedRow();
			if (rowQTrinhSelected >= 0) {
				txtIdProcedure.setText(dtmProcedure.getValueAt(rowQTrinhSelected, 0).toString());
				txtNameProcedure.setText(dtmProcedure.getValueAt(rowQTrinhSelected, 1).toString());
				txtPriceProcedure.setText(dtmProcedure.getValueAt(rowQTrinhSelected, 2).toString());
				spnOrder.setValue(Integer.parseInt(dtmListProcedure.getValueAt(rowQTrinhSelected, 3).toString()));
				btnInsertProcedure.setIcon(new ImageIcon("images\\Close-2-icon.png"));
				btnUpdateProcedure.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
				btnChange.setIcon(new ImageIcon("images\\exchange.png"));
			}
		}

	}

	@Override
	public void mousePressed(MouseEvent e) {

	}

	@Override
	public void mouseReleased(MouseEvent e) {

	}

	@Override
	public void mouseEntered(MouseEvent e) {
	}

	@Override
	public void mouseExited(MouseEvent e) {

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Object o = e.getSource();
		if (o.equals(btnClean)) {
			cleanProduct();
			randomIdProduct();
			spnOrder.setValue(1);
			details = new entity.DetailProduction();
		} else if (o.equals(btnChange)) {
			int rowSelected = tblProcedure.getSelectedRow();
			if (rowSelected >= 0) {
				tblProcedure.removeRowSelectionInterval(rowSelected, rowSelected);
			}
			btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
			btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
			btnUpdateProcedure.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
			cleanTextFieldProcedure();
			txtNameProcedure.requestFocus();
			if (!txtIdProduct.getText().isEmpty()) {
				randomIdProcedure();
			}
		}
		else if(o.equals(btnModal)) {
			details = detailDAO.searchDetailProductionById(txtIdProduct.getText());
			if(details == null) {
				details = new entity.DetailProduction();
			}
			else {
				prevState = details.getState();
			}
			DetailProduction detail = new DetailProduction(txtIdProduct.getText(), details);
			detail.setVisible(true);
			
		}
		else if (o.equals(btnInsertProcedure)) {
			boolean regexProcedure = regexProcedure();
			if (regexProcedure) {
				if (btnInsertProcedure.getIcon().toString().equals("images\\math-add-icon.png")) {
					int rowCountProcedure = dtmProcedure.getRowCount();
					boolean checkContainProcedure = false;
					for (int i = 0; i < rowCountProcedure; i++) {
						if (dtmProcedure.getValueAt(i, 0).toString().equals(txtIdProcedure.getText())) {
							checkContainProcedure = true;
							JOptionPane.showMessageDialog(this, "Quy trình đã được thêm vào table");
							break;
						}
					}

					if (!checkContainProcedure) {
						Produre procedure = new Produre(txtIdProcedure.getText(), txtNameProcedure.getText(),
								Double.parseDouble(txtPriceProcedure.getText()),
								Integer.parseInt(spnOrder.getValue().toString()), txtIdProduct.getText());
						addRowListProcedure(procedure, dtmProcedure);
						JOptionPane.showMessageDialog(this, "Thêm quy trình thành công!!!");
						randomIdProcedure();
						List<entity.Product> listProduct = Dao_Product.getListProduct(cmbFilterState.getSelectedItem().toString());
						if (listProduct.contains(Dao_Product.searchProductByIdProduct(txtIdProduct.getText()))) {
							List<Produre> listProcedure = Dao_Product
									.getListProcedurebyIdProduct(txtIdProduct.getText());
							if (dtmProcedure.getRowCount() != listProcedure.size()) {
								btnInsertProduct.setText("Sửa sản phẩm");
								btnInsertProduct.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
								btnUpdateProduct.setIcon(new ImageIcon("images\\math-add-icon.png"));
							}
						} else {
							randomIdProcedure();
						}
					}

				} else {
					if (btnInsertProcedure.getIcon().toString().equals("images\\Text-Edit-icon.png")) {
						Produre procedure = new Produre(txtIdProcedure.getText(), txtNameProcedure.getText(),
								Double.parseDouble(txtPriceProcedure.getText()),
								Integer.parseInt(spnOrder.getValue().toString()), txtIdProduct.getText());
						if (Dao_Product.updateProcedure(procedure)) {
							JOptionPane.showMessageDialog(this, "Sửa quy trình thành công!!!");
							deleteDataOnTableModelProcedure(dtmListProcedure);
							loadListProcedureByIdProduct(txtIdProduct.getText(), dtmListProcedure);
							deleteDataOnTableModelProcedure(dtmProcedure);
							loadListProcedureByIdProduct(txtIdProduct.getText(), dtmProcedure);
						} else {
							JOptionPane.showMessageDialog(this, "Sửa quy trình thất bại!!!");
						}
					} else {
						int confirm = JOptionPane.showConfirmDialog(this, "Bạn có chắc xóa Quy Trình này không?");
						if(confirm == JOptionPane.YES_OPTION) {
							if (Dao_Product.deleteProcedure(txtIdProcedure.getText())) {
								JOptionPane.showMessageDialog(this, "Xóa quy trình thành công!!!");
								deleteDataOnTableModelProcedure(dtmListProcedure);
								deleteDataOnTableModelProcedure(dtmProcedure);
								loadListProcedureByIdProduct(txtIdProduct.getText(), dtmListProcedure);
								loadListProcedureByIdProduct(txtIdProduct.getText(), dtmProcedure);
								btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
								btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
							} else {
								JOptionPane.showMessageDialog(this, "Xóa quy trình thất bại!!! ");
							}
						}
						else if(confirm == JOptionPane.NO_OPTION) {
							JOptionPane.showMessageDialog(this, "Hủy xóa Quy Trình thành công!!!");
						}
					}

				}
			}
		} else if (o.equals(btnInsertProduct)) {
			boolean regexProduct = regexProduct();
			if (regexProduct) {
				if (btnInsertProduct.getText().equals("Thêm sản phẩm")) {
					entity.Product product = new entity.Product(txtIdProduct.getText(), txtNameProduct.getText(),
							1);
					boolean checkContainProduct = checkContainProduct(product);
					int rowCountProcedure = dtmProcedure.getRowCount();
					Produre procedure = new Produre();
					for (int i = 0; i < rowCountProcedure; i++) {
						procedure = new Produre(dtmProcedure.getValueAt(i, 0).toString(),
								dtmProcedure.getValueAt(i, 1).toString(),
								Double.parseDouble(dtmProcedure.getValueAt(i, 2).toString()),
								Integer.parseInt(dtmProcedure.getValueAt(i, 3).toString()), txtIdProduct.getText());
						ListProcedure.add(procedure);
					}
					if (!checkContainProduct) {
						boolean insertProduct = Dao_Product.insertProduct(product);
						boolean insertListProcedure = Dao_Product.insertListProcedure(ListProcedure);
						if (insertProduct) {
							if(details.getDetailProductionID() != 0) {
								Dao_Product.insertListProcedure(ListProcedure);
								detailDAO.insertDetailProduction(details);
							}
							else {
								details.setProductId(txtIdProduct.getText());
								int detailID = createRandomIdDetail();
								details.setDetailProductionID(detailID);
								details.setState("Sản Xuất");
								detailDAO.insertDetailProduction(details);
							}
							JOptionPane.showMessageDialog(this, "Thêm sản phẩm thành công!!!");
							ListProcedure = new ArrayList<Produre>();
							deleteDataOnTableModelProduct();
							cleanProduct();
							randomIdProduct();
							details = new entity.DetailProduction();
						}
					} else {
						JOptionPane.showMessageDialog(this, "Sản phẩm đã tồn tại!!!");
					}
				} else {
					int rowCountProcedure = dtmProcedure.getRowCount();
					Produre procedure = new Produre();
					for (int i = 0; i < rowCountProcedure; i++) {
						procedure = new Produre(dtmProcedure.getValueAt(i, 0).toString(),
								dtmProcedure.getValueAt(i, 1).toString(),
								Double.parseDouble(dtmProcedure.getValueAt(i, 2).toString()),
								Integer.parseInt(dtmProcedure.getValueAt(i, 3).toString()), txtIdProduct.getText());
						ListProcedure.add(procedure);
					}
					boolean updateListProcedure = Dao_Product.updateListProcedure(ListProcedure, txtIdProduct.getText());
					entity.Product product = new entity.Product(txtIdProduct.getText(), txtNameProduct.getText(),
							1);
					boolean updateProduct = Dao_Product.updateProduct(product);
					boolean updateDetailProduction = false;
//					if(details.getDetailProductionID() == 0) {
//						details = detailDAO.searchDetailProductionById(txtIdProduct.getText());
//						prevState = details.getState();
//					}
					if(
						(prevState.equals("Ngưng Sản Xuất") && details.getState().equals("Sản Xuất")) 
						|| (prevState.equals("Hoàn Thành") && (details.getState().equals("Sản Xuất") || details.getState().equals("Ngưng Sản Xuất")))
						|| (prevState.equals("Sản Xuất") && (details.getState().equals("Ngưng Sản Xuất") || details.getState().equals("Hoàn Thành")))
					) {
						details.setDetailProductionID(createRandomIdDetail());
						updateDetailProduction = detailDAO.insertDetailProduction(details);
					}
					else if(prevState.equals("Sản Xuất") || prevState.equals("Ngưng Sản Xuất") || prevState.equals("Hoàn Thành")) {
						if(prevState.equals(details.getState())) {
							updateDetailProduction = detailDAO.updateDetailNotDate(details);
						}
					}
					if (updateProduct == true && updateListProcedure == true && updateDetailProduction == true) {
						JOptionPane.showMessageDialog(this, "Sửa sản phẩm thành công!!!");
						ListProcedure = new ArrayList<Produre>();
						deleteDataOnTableModelProduct();
						deleteDataOnTableModelProcedure(dtmListProcedure);
						loadListProduct(cmbFilterState.getSelectedItem().toString());
						loadListProcedureByIdProduct(product.getProductID(), dtmListProcedure);
						btnInsertProduct.setIcon(new ImageIcon("images\\math-add-icon.png"));
						btnUpdateProduct.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
						btnInsertProduct.setText("Thêm sản phẩm");
					}
				}
			}
		} else if (o.equals(btnDeleteProduct)) {
			List<entity.DetailProduction> listDetail = detailDAO.getListDetailbyIdProduct(txtIdProduct.getText());
			if(listDetail.size() == 0) {
				int confirm = JOptionPane.showConfirmDialog(this, "Bạn có chắc xóa Sản Phẩm này không?");
				if(confirm == JOptionPane.YES_OPTION) {
					if (Dao_Product.deleteProduct(txtIdProduct.getText())) {
						JOptionPane.showMessageDialog(this, "Xóa sản phẩm thành công!!!");
						deleteDataOnTableModelProduct();
						deleteDataOnTableModelProcedure(dtmListProcedure);
						loadListProduct(cmbFilterState.getSelectedItem().toString());
					}
					else {
						JOptionPane.showMessageDialog(this, "Sản phẩm hiện đang có quy trình thực hiện, không thể xóa!!! ");
					}
				}
				else if(confirm == JOptionPane.NO_OPTION) {
					JOptionPane.showMessageDialog(this, "Hủy xóa Sản Phẩm thành công!!!");
				}
			}
			else{
				int confirm = JOptionPane.showConfirmDialog(this, "Bạn có chắc xóa Sản Phẩm này không?");
				if(confirm == JOptionPane.YES_OPTION) {
					if(listDetail.size() == 1 && listDetail.get(0).getQuantityProduction() == 0) {
						boolean deleteDetail = detailDAO.deleteDetail(listDetail.get(0).getDetailProductionID());
						boolean deleteProduct = Dao_Product.deleteProduct(txtIdProduct.getText());
						if(deleteDetail == true && deleteProduct == true) {
							JOptionPane.showMessageDialog(this, "Xóa sản phẩm thành công!!!");
							deleteDataOnTableModelProduct();
							deleteDataOnTableModelProcedure(dtmListProcedure);
							loadListProduct(cmbFilterState.getSelectedItem().toString());
						}
					}
					else if(listDetail.size() > 1) {
						int totalQuantity = 0;
						for(entity.DetailProduction dt : listDetail) {
							totalQuantity += dt.getQuantityProduction();
						}
						if(totalQuantity == 0) {
							boolean deleteDetail = detailDAO.deleteListDetail(txtIdProduct.getText());
							boolean deleteProduct = Dao_Product.deleteProduct(txtIdProduct.getText());
							if(deleteDetail == true && deleteProduct == true) {
								JOptionPane.showMessageDialog(this, "Xóa sản phẩm thành công!!!");
								deleteDataOnTableModelProduct();
								deleteDataOnTableModelProcedure(dtmListProcedure);
								loadListProduct(cmbFilterState.getSelectedItem().toString());
							}
						}
						else {
							JOptionPane.showMessageDialog(this, "Sản phẩm đã được sản xuất hoặc đang được sản xuất, không thể xóa!!! ");
						}
					}
				}
				else if(confirm == JOptionPane.NO_OPTION) {
					JOptionPane.showMessageDialog(this, "Hủy xóa Sản Phẩm thành công!!!");
				}
			}
		} else if (o.equals(btnDeleteProcedure)) {
			int confirm = JOptionPane.showConfirmDialog(this, "Bạn có chắc xóa Quy Trình này không?");
			if (confirm == JOptionPane.YES_OPTION) {
				if(Dao_Product.deleteProcedure(txtIdProcedure.getText())) {
					JOptionPane.showMessageDialog(this, "Xóa quy trình thành công!!!");
					deleteDataOnTableModelProcedure(dtmListProcedure);
					deleteDataOnTableModelProcedure(dtmProcedure);
					loadListProcedureByIdProduct(txtIdProduct.getText(), dtmListProcedure);
					loadListProcedureByIdProduct(txtIdProduct.getText(), dtmProcedure);
				}
				else {
					JOptionPane.showMessageDialog(this, "Xóa quy trình thất bại!!! ");
				}
			} else if(confirm == JOptionPane.NO_OPTION){
				JOptionPane.showMessageDialog(this, "Hủy xóa Quy Trình thành công!!!");
			}
		} else if (o.equals(btnUpdateProduct)) {
			if (btnUpdateProduct.getIcon().toString().equals("images\\Text-Edit-icon.png")) {
				btnInsertProduct.setText("Sửa sản phẩm");
				btnInsertProduct.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
				btnUpdateProduct.setIcon(new ImageIcon("images\\math-add-icon.png"));
				if (!txtIdProduct.getText().isEmpty()) {
					randomIdProcedure();
				}
			} else {
				btnInsertProduct.setText("Thêm sản phẩm");
				btnInsertProduct.setIcon(new ImageIcon("images\\math-add-icon.png"));
				btnUpdateProduct.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
				cleanProduct();
				randomIdProduct();
			}
		} else if (o.equals(btnUpdateProcedure)) {
			if (btnUpdateProcedure.getIcon().toString().equals("images\\Text-Edit-icon.png")) {
				btnInsertProcedure.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
				btnUpdateProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
			} else {
				btnInsertProcedure.setIcon(new ImageIcon("images\\math-add-icon.png"));
				btnUpdateProcedure.setIcon(new ImageIcon("images\\Text-Edit-icon.png"));
				btnChange.setIcon(new ImageIcon("images\\Clear-icon.png"));
			}
		} else if (o.equals(btnSearchIdProduct)) {
			if (txtSearchProduct.getText().isEmpty()) {
				dtmProduct.setRowCount(0);
				loadListProduct(cmbFilterState.getSelectedItem().toString());
			} else {
				entity.Product product = Dao_Product.searchProductByIdProduct(txtSearchProduct.getText());
				if (product != null) {
					dtmProduct.setRowCount(0);
					addRowProduct(product);
				} else {
					dtmProduct.setRowCount(0);
				}
			}
		} else if (o.equals(btnSearchIdProcedure)) {
			if (txtSearchProcedure.getText().isEmpty()) {
				dtmListProcedure.setRowCount(0);
				loadListProcedure();
			}else {
				Produre procedure = Dao_Product.searchProcedureByIdProcedure(txtSearchProcedure.getText());
				if (procedure != null) {
					dtmListProcedure.setRowCount(0);
					addRowListProcedure(procedure, dtmListProcedure);
				} else {
					dtmListProcedure.setRowCount(0);
				}
			}
		}

	}

	public boolean regexProduct() {
		String announce = "";
		String regexIdProduct = "^[A-Z]{2}[0-9]{3}$";
		String regexQuantityProductive = "(^[1-9][0-9]*)+";
		if (txtIdProduct.getText().isEmpty() || txtNameProduct.getText().isEmpty()) {
			announce += "Vui lòng nhập đầy đủ thông tin sản phẩm";
		} else {
			if (!txtIdProduct.getText().matches(regexIdProduct)) {
				announce += "Mã sản phẩm phải bắt đầu bằng 2 chữ in hoa và theo sau là 3 chữ số \n";
				txtIdProduct.requestFocus();
				txtIdProduct.selectAll();
			} 
		}
		if (announce.isEmpty()) {
			return true;
		} else {
			JOptionPane.showMessageDialog(this, announce);
			return false;
		}
	}

	public boolean regexProcedure() {
		String announce = "";
		String regexIdProcedure = "^" + txtIdProduct.getText() + "[0-9]{2}$";
		String regexPriceProcedure = "(^[1-9][0-9]*(\\.[0-9])?)+";
		if (txtIdProcedure.getText().isEmpty() || txtNameProcedure.getText().isEmpty()
				|| txtPriceProcedure.getText().isEmpty()) {
			announce += "Vui lòng nhập đầy đủ thông tin quy trình";
		} else {
			if (!txtIdProcedure.getText().matches(regexIdProcedure)) {
				announce += "Mã quy trình phải bắt đầu bằng mã sản phẩm và theo sau 2 chữ số \n";
				txtIdProcedure.requestFocus();
				txtIdProcedure.selectAll();
			} else if (!txtPriceProcedure.getText().matches(regexPriceProcedure)) {
				announce += "Giá quy trình phải lớn hơn 0";
				txtPriceProcedure.requestFocus();
				txtPriceProcedure.selectAll();
			}
		}
		if (announce.isEmpty()) {
			return true;
		} else {
			JOptionPane.showMessageDialog(this, announce);
			return false;
		}

	}
}
