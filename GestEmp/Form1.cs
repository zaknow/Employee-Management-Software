﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;



namespace GestEmp
{
    public partial class Form1 : MetroFramework.Forms.MetroForm
    {
       

        public Form1()
        {
            InitializeComponent();
            BTN_Accueil.BackColor = Color.FromArgb(0, 174, 219);

            //afficher l'icon list 
            pictureBox8.Parent = UCAccueil.instanceUCAccueil;
            pictureBox8.BackColor = Color.Transparent;



        }
        private void Form1_Load(object sender, EventArgs e)
        {
            //-- rounded shape for picture box
            /*
            System.Drawing.Drawing2D.GraphicsPath gp = new System.Drawing.Drawing2D.GraphicsPath();
            gp.AddEllipse(0, 0, pictureBox4.Width - 1, pictureBox4.Height - 1);
            Region rg = new Region(gp);
            pictureBox4.Region = rg;*/
            //call the click event . 
            BTN_Accueil_Click(sender, e);

            //initialise the picture in 'Modifier/supprimer'
            pictureBox3.BackgroundImage = new Bitmap(GestEmp.Properties.Resources.user4);
            pictureBox3.BackgroundImageLayout = ImageLayout.Stretch;

            //initialise the picture in 'AJouter'
            pictureBox4.BackgroundImage = new Bitmap(GestEmp.Properties.Resources.user4);
            pictureBox4.BackgroundImageLayout = ImageLayout.Stretch;
            //initialise the background picture
            if (!panel1.Controls.Contains(UCAccueil.instanceUCAccueil))
            {
                panel1.Controls.Add(UCAccueil.instanceUCAccueil);
                UCAccueil.instanceUCAccueil.Dock = DockStyle.Fill;
                UCAccueil.instanceUCAccueil.BringToFront();
            }
            else
                UCAccueil.instanceUCAccueil.BringToFront();
            //ajouter ucdepartement a panel2
            panel2.Controls.Add(UCDepartement.instanceUCDepartement);
            UCDepartement.instanceUCDepartement.Dock = DockStyle.Fill;
            // make metrotab fill the panel2
              metroTabControl1.Dock = DockStyle.Fill;
           // MessageBox.Show("hello world");
            fill_cb();


        }
        

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        // drag the panel ------------------------------------------------
        private bool dragging = false;
        private Point dragCursorPoint;
        private Point dragFormPoint;

        private void metroPanel2_MouseDown_1(object sender, MouseEventArgs e)
        {
            dragging = true;
            dragCursorPoint = Cursor.Position;
            dragFormPoint = this.Location;
        }

        private void metroPanel2_MouseMove_1(object sender, MouseEventArgs e)
        {
            if (dragging)
            {
                Point dif = Point.Subtract(Cursor.Position, new Size(dragCursorPoint));
                this.Location = Point.Add(dragFormPoint, new Size(dif));
            }
        }

        private void metroPanel2_MouseUp_1(object sender, MouseEventArgs e)
        {
            dragging = false;
        }
        //----------------------- finish drag---------------------------
        private void metroLabel9_Click(object sender, EventArgs e)
        {
        }

        private void BTN_Accueil_Click(object sender, EventArgs e)
        {
            BTN_Accueil.BackColor = Color.FromArgb(0, 174, 219);
            BTN_Employe.BackColor = Color.FromArgb(34, 34, 34);
            BTN_Departement.BackColor = Color.FromArgb(34, 34, 34);
            BTN_Statistique.BackColor = Color.FromArgb(34, 34, 34);

            panel2.Hide();
            panel1.BringToFront();
        }

        private void BTN_Employe_Click(object sender, EventArgs e)
        {
            BTN_Employe.BackColor = Color.FromArgb(0, 174, 219);
            BTN_Accueil.BackColor = Color.FromArgb(34, 34, 34);
            BTN_Departement.BackColor = Color.FromArgb(34, 34, 34);
            BTN_Statistique.BackColor = Color.FromArgb(34, 34, 34);

            panel2.Show();
            panel2.BringToFront();
            metroTabControl1.BringToFront();
            //if you click on 'Employé' the image will be initialised
            /* if (!(pictureBox4.BackgroundImage == GestEmp.Properties.Resources.usericon))
             {
                 pictureBox4.BackgroundImage = new Bitmap(GestEmp.Properties.Resources.usericon);
                 pictureBox4.BackgroundImageLayout = ImageLayout.Stretch;
             }*/

        }

        private void BTN_Departement_Click(object sender, EventArgs e)
        {
            BTN_Departement.BackColor = Color.FromArgb(0, 174, 219);
            BTN_Employe.BackColor = Color.FromArgb(34, 34, 34);
            BTN_Accueil.BackColor = Color.FromArgb(34, 34, 34);
            BTN_Statistique.BackColor = Color.FromArgb(34, 34, 34);
            panel2.Show();
            panel2.BringToFront();
            UCDepartement.instanceUCDepartement.BringToFront();
        }

        private void BTN_Statistique_Click(object sender, EventArgs e)
        {
            BTN_Statistique.BackColor = Color.FromArgb(0, 174, 219);
            BTN_Departement.BackColor = Color.FromArgb(34, 34, 34);
            BTN_Employe.BackColor = Color.FromArgb(34, 34, 34);
            BTN_Accueil.BackColor = Color.FromArgb(34, 34, 34);
            panel2.Hide();
            panel1.BringToFront();
        }

        private void pictureBox8_MouseLeave(object sender, EventArgs e)
        {
            pictureBox8.Image = Properties.Resources.list2;
            pictureBox8.Size = new Size(36, 36);
        }

        private void button1_MouseDown(object sender, MouseEventArgs e)
        {
            button1.Size = new Size(112, 33);
        }

        private void button2_MouseDown(object sender, MouseEventArgs e)
        {
            button2.Size = new Size(113, 34);
        }

        private void button2_MouseUp(object sender, MouseEventArgs e)
        {
            button2.Size = new Size(114, 35);
        }

        private void button1_MouseUp(object sender, MouseEventArgs e)
        {
            button1.Size = new Size(114, 35);
        }

        private void button6_MouseDown(object sender, MouseEventArgs e)
        {
            button6.Size = new Size(127, 33);
        }

        private void button6_MouseUp(object sender, MouseEventArgs e)
        {
            button6.Size = new Size(128, 35);
        }

        private void metroTabPage1_Click(object sender, EventArgs e)
        {
        }

        private void button3_MouseDown(object sender, MouseEventArgs e)
        {
            button3.Size = new Size(120, 30);
        }

        private void button3_MouseUp(object sender, MouseEventArgs e)
        {
            button3.Size = new Size(124, 35);
        }

        private void button4_MouseDown(object sender, MouseEventArgs e)
        {
            button4.Size = new Size(120, 30);
        }

        private void button4_MouseUp(object sender, MouseEventArgs e)
        {
          button4.Size = new Size(124, 35);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            /* if(!panel2.Controls.Contains(UCModifier.instanceUCModifier))
             panel2.Controls.Add(UCModifier.instanceUCModifier);
             UCModifier.instanceUCModifier.Dock = DockStyle.Fill;
             UCModifier.instanceUCModifier.BringToFront();
             panel2.Location = new Point(175, 150);
             panel2.Parent = this;

             panel2.BringToFront();*/
            Form2 f = new Form2();
            f.Show(this);



        }

        private void metroLabel13_Click(object sender, EventArgs e)
        {

        }

        private void metroLabel18_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)  // button vider - ajouter Tab
        {
            Clear_metroTabPage1();
            // clear all textBoxes
            /*TXB_Ajouter_Nom.Text = "";
            TXB_Ajouter_Prenom.Text = "";
            TXB_Ajouter_Age.Text = "";
            TXB_Ajouter_Ntel.Text = "";
            TXB_Ajouter_Salaire.Text = "";
            TXB_Ajouter_Email.Text = "";*/

            //ctrl.Text = "";
        }

        

        private void button7_MouseHover(object sender, EventArgs e)
        {
          //  button7.Size = new Size(30, 28);
        }

        private void button7_MouseLeave(object sender, EventArgs e)
        {
            //button7.Size = new Size(27, 25);
        }

        private void button7_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog dlg = new OpenFileDialog())
            {
                dlg.Title = "Open Image";
                dlg.Filter = "image files (*.png)|*.png";

                if (dlg.ShowDialog() == DialogResult.OK)
                {
                    PictureBox PictureBox1 = new PictureBox();

                    // Create a new Bitmap object from the picture file on disk,
                    // and assign that to the PictureBox.Image property
                    pictureBox4.BackgroundImage = new Bitmap(dlg.FileName);
                    pictureBox4.BackgroundImageLayout = ImageLayout.Stretch;


                }
            }
        }

        private void button5_MouseDown(object sender, MouseEventArgs e)
        {
            button5.Size = new Size(100, 27);
        }

        private void button5_MouseUp(object sender, MouseEventArgs e)
        {
            button5.Size = new Size(101, 28);
        }

        private void metroTabControl1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            this.Enabled = false;
            Form2 f = new Form2();
            f.ShowDialog(this);
            
        }

        private void button5_Click(object sender, EventArgs e)
        {

            EmployeInfo emp = new EmployeInfo();
            DataRow[] row = Provider.ds.Tables["Employee"].Select("ID_EMP="+ LBL_Mod_Sup_IdEmp.Text);
            emp.Info_NomPrenom.Text = row[0][1].ToString() +"  "+ row[0][2].ToString();
            emp.Info_IdEmp.Text = row[0][0].ToString();
            //emp.Info_PosteNom.Text = 
            
            emp.Info_Sexe.Text = row[0][7].ToString() ;
            emp.Info_Nom.Text = row[0][1].ToString();
            emp.Info_Prenom.Text = row[0][2].ToString();
            emp.Info_Tel.Text = row[0][3].ToString();
            emp.Info_Email.Text = row[0][4].ToString();
            emp.Info_DateN.Text = row[0][5].ToString();
            emp.Info_DateE.Text =row[0][6].ToString();
            emp.Info_Salaire.Text = row[0][8].ToString();
            emp.Info_Adresse.Text = row[0][9].ToString();
            // selet the name of Pays from Pays Table  using its ID in the Employee table 
            var dt = Provider.ds.Tables["Pays"].AsEnumerable();
            emp.Info_Pays.Text =( from r in dt
                    where r.Field<int>("ID_PAYS")== int.Parse(row[0][10].ToString())
                                 select r.Field<string>("Nom_pays")).First<string>();

            dt= Provider.ds.Tables["Region"].AsEnumerable();
            emp.Info_Region.Text = (from r in dt
                                  where r.Field<int>("ID_Region") == int.Parse(row[0][11].ToString())
                                  select r.Field<string>("Nom_region")).First<string>();
            dt=Provider.ds.Tables["Ville"].AsEnumerable();
            emp.Info_Ville.Text = (from r in dt
                                    where r.Field<int>("ID_VILLE") == int.Parse(row[0][12].ToString())
                                    select r.Field<string>("Nom_ville")).First<string>();
            dt=Provider.ds.Tables["Departement"].AsEnumerable();
            emp.Info_Departement.Text = (from r in dt
                                   where r.Field<int>("ID_DEPT") == int.Parse(row[0][13].ToString())
                                   select r.Field<string>("Dept_Nom")).First<string>();
            emp.ShowDialog();




            //.Show();
        }

        private void metroTile1_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            metroGrid1.DataSource = null;
            metroGrid1.Refresh();
            Provider.dt2 = Provider.ds.Tables["Employee"].DefaultView.ToTable(true,"ID_EMP","Nom","Prenom","Tel","id_ville","sexe","adress");
            //Change the column name 
            Provider.dt2.Columns["id_ville"].ColumnName = "Ville";
            Provider.dt2.Columns["ID_EMP"].ColumnName = "ID Employé";
            metroGrid1.DataSource = Provider.dt2;
            
            //metroGrid1.DataSource = Provider.ds.Tables["Employee"];

        }

        private void button8_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog dlg = new OpenFileDialog())
            {
                dlg.Title = "Open Image";
                dlg.Filter = "image files (*.png)|*.png";

                if (dlg.ShowDialog() == DialogResult.OK)
                {
                    PictureBox PictureBox1 = new PictureBox();

                    // Create a new Bitmap object from the picture file on disk,
                    // and assign that to the PictureBox.Image property
                    pictureBox4.BackgroundImage = new Bitmap(dlg.FileName);
                    pictureBox4.BackgroundImageLayout = ImageLayout.Stretch;


                }
            }
        }

        // --------------- boutton Valier Ajoute

        private void button3_Click(object sender, EventArgs e)
        {
            bool vide = true;
            try
            {
                //vide= Control_check();
                if (vide == true)
                {

                    DataRow row = Provider.ds.Tables["Employee"].NewRow();

                    Provider.da = new SqlDataAdapter("select * from Employee", Provider.cnx);
                    /* FIRST SOLUTION :the problem of this solution is that if another user add a new row 
                     after you fill your tables in dataset . you will get different ID_EMP
                     because the new ID_EMP in the database is already incremented by another 
                     user . and the new ID_EMP in your dataset will incremented only by 1 



                    //select the max value of ID_EMP from the table in dataset
                    DataRow[] max = Provider.ds.Tables["Employee"].Select("ID_EMP = max(ID_EMP)");
                    // parse the max datarow value  to an int 
                    int i = int.Parse(max[0][0].ToString());
                    MessageBox.Show(" the ID_EMP of the Current added  EMployee is " + i+1);

                    // assign the values of controls to the new datarow => row 
                    row[0] = i+1;*/

                    // SECOND SOLUTION : use connected mode to get the max value directly  from the database


                    /*Provider.GetNewID_EMP() returns a string that contains the Max(ID_EMP)+1
                     from the database using connected mode */
                    MessageBox.Show("the ID_EMP of the Current added  Employee is " + Provider.GetNewID_EMP());
                    //   row[0] = Provider.GetNewID_EMP();
                    row[1] = TXB_Ajouter_Nom.Text;
                    row[2] = TXB_Ajouter_Prenom.Text;
                    row[3] = TXB_Ajouter_Ntel.Text;
                    row[4] = TXB_Ajouter_Email.Text;
                    row[5] = DTP_Ajouter_Daten.Value;
                    row[6] = DTP_Ajouter_DateEmb.Value;

                    if (RD_Ajouter_M.Checked) row[7] = "M";
                    else row[7] = "F";
                    row[8] = TXB_Ajouter_Salaire.Text;
                    row[9] = TXB_Ajouter_Adresse.Text;
                    row[10] = CB_Ajouter_Pays.SelectedValue.ToString();
                    row[11] = CB_Ajouter_Region.SelectedValue.ToString();
                    row[12] = CB_Ajouter_Ville.SelectedValue.ToString();
                    row[13] = CB_Ajouter_Departement.SelectedValue.ToString();
                    //row[14] = CB_Ajouter_Poste.SelectedValue.ToString();


                    /*THIRD SOLUTION : reload your  Employee table after each add 
                              */

                    Provider.ds.Tables["Employee"].Rows.Add(row);
                    Provider.Cmb = new SqlCommandBuilder(Provider.da);
                    Provider.da.Update(Provider.ds, "Employee");
                    // clear the table Employee => table.clear() will delete all the rows and format
                    // table.rows.clear() will delete just rows and keep the format 
                   

/*
                    // this Code displays all the ID_EMP that are currently in  Provider.ds.Tables["Employee"]
                    string a = "";
                    foreach (DataRow row2 in Provider.ds.Tables["Employee"].Rows)
                    {

                        a += row2[0].ToString() + "  /n";

                        MessageBox.Show(" " + a);
                    }*/
                }
            }
            catch (Exception e1) {
                MessageBox.Show(e1.Message.ToString());
            }
            finally {
                Provider.ds.Tables["Employee"].Rows.Clear();
                Provider.da.Fill(Provider.ds, "Employee");


            }
        }
        private void TXB_Ajouter_Nom_Click(object sender, EventArgs e)
        {

        }



        private void fill_cb()
        {
            // 1 )Fill pays table of the  dataset and  combobox
            Provider.da = new SqlDataAdapter("select * from Pays order by ID_PAYS", Provider.cnx);
            Provider.da.Fill(Provider.ds, "Pays");

            //stackoverflow.com/questions/14111879/how-to-prevent-selectedindexchanged-event-when-datasource-is-bound
            this.CB_Ajouter_Pays.SelectedValueChanged -= new EventHandler(CB_Ajouter_Pays_SelectedValueChanged);

            CB_Ajouter_Pays.DataSource = Provider.ds.Tables["Pays"];
            CB_Ajouter_Pays.ValueMember = "ID_PAYS";
            CB_Ajouter_Pays.DisplayMember = "Nom_pays";
            this.CB_Ajouter_Pays.SelectedValueChanged += new EventHandler(CB_Ajouter_Pays_SelectedValueChanged);
            CB_Ajouter_Pays.SelectedIndex = -1;



            /*after you set the datasource you can't affect or add items simply 
             like CB_Ajouter_Region.Items.Add(Provider.ds.Tables["region"].Rows[i][1]);*/


            // 2 ) Fill region table  all depend on pays

            Provider.da = new SqlDataAdapter("select * from Region order by ID_Region ", Provider.cnx);    //R join pays P on R.Id_pays = P.Id_pays where Nom_pay = '"+CB_Ajouter_Pays.SelectedText+"'"
            Provider.da.Fill(Provider.ds, "Region");

        

            //  3) Fill the ville  table in the dataset 
            Provider.da = new SqlDataAdapter("Select * from Ville order by ID_VILLE", Provider.cnx);
            Provider.da.Fill(Provider.ds, "Ville");

            // 4 ) Fill departement combobox and table 
            Provider.da = new SqlDataAdapter("select * from Departement", Provider.cnx);
            Provider.da.Fill(Provider.ds, "departement");

            CB_Ajouter_Departement.ValueMember = "ID_DEPT";
            CB_Ajouter_Departement.DisplayMember = "Dept_Nom";
            CB_Ajouter_Departement.DataSource = Provider.ds.Tables["departement"];
            CB_Ajouter_Departement.SelectedIndex = -1;

            //5 ) Fill Employee table in the dataset 
            Provider.da = new SqlDataAdapter("select * from Employee order by ID_EMP", Provider.cnx);
            Provider.da.Fill(Provider.ds, "Employee");



        }

        private void CB_Ajouter_Region_SelectedValueChanged(object sender, EventArgs e)
        {
            if (CB_Ajouter_Region.SelectedIndex != -1)
            {
                Fill_CB_Ajouter_Ville(CB_Ajouter_Region.SelectedValue.ToString());
            }
            CB_Ajouter_Ville.SelectedIndex = -1;
        }

        private void CB_Ajouter_Pays_SelectedValueChanged(object sender, EventArgs e)
        {
            if (CB_Ajouter_Pays.SelectedIndex != -1)
            {
                Fill_CB_Ajouter_region(CB_Ajouter_Pays.SelectedValue.ToString());
            }
            CB_Ajouter_Region.SelectedIndex = -1;
            CB_Ajouter_Ville.DataSource = null;
        }

        //------------------------- function 1 Fill The CB region using an ID_Pays
        private void Fill_CB_Ajouter_region(string ID_Pays)
        {

            // clear the  items of CB_Ajouter_Region if it's alredy filled
            //stackoverflow.com/questions/14376577/clear-combobox-datasource-items
            CB_Ajouter_Region.DataSource = null;

            // select the data from a datable in dataset with a condition then affect the rows to 
            // a datarow table 
            DataRow[] datarow = Provider.ds.Tables["Region"].Select("id_pays = " + ID_Pays);
            // create a datatable with the same shema of  the region datatable this is called cloning 
            DataTable table = Provider.ds.Tables["Region"].Clone();
            // import the rows of the datarow to the datatable 
            foreach (DataRow row in datarow)
                table.ImportRow(row);
            this.CB_Ajouter_Region.SelectedValueChanged -= new EventHandler(CB_Ajouter_Region_SelectedValueChanged);
            CB_Ajouter_Region.DataSource = table;
            CB_Ajouter_Region.ValueMember = "ID_Region";
            CB_Ajouter_Region.DisplayMember = "Nom_region";
            this.CB_Ajouter_Region.SelectedValueChanged += new EventHandler(CB_Ajouter_Region_SelectedValueChanged);
        }

        //------------------------- function 1 Fill The CB ville using an id_region

        private void Fill_CB_Ajouter_Ville(string id_region)
        {
            CB_Ajouter_Ville.DataSource = null;
            DataRow[] datarow = Provider.ds.Tables["Ville"].Select("id_region=" + id_region);
            DataTable table = Provider.ds.Tables["Ville"].Clone();
            foreach (DataRow row in datarow)
                table.ImportRow(row);

            CB_Ajouter_Ville.DataSource = table;
            CB_Ajouter_Ville.ValueMember = "ID_VILLE";
            CB_Ajouter_Ville.DisplayMember = "Nom_ville";

        }
        public bool Control_check()
        {
            int i = 0;
            bool bol = true;
            foreach (Control ctrl in metroTabPage1.Controls)
            {
                if (ctrl is MetroFramework.Controls.MetroTextBox)
                {
                    if (ctrl.Text == "")
                    {
                        MessageBox.Show("Veuillez remplir tout les champs", "Message", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                        bol = false;
                        break;
                    }
                }
                if (ctrl is MetroFramework.Controls.MetroComboBox)
                {
                    var ctr2 = ctrl as MetroFramework.Controls.MetroComboBox;
                    if (ctr2.SelectedIndex==-1)
                    {
                        MessageBox.Show("Veuillez selectionner les combobox", "Message", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                        bol = false;
                        break;
                    }
                }
                if (ctrl is MetroFramework.Controls.MetroRadioButton)
                {
                    var ctr2 = ctrl as MetroFramework.Controls.MetroRadioButton;
                   
                        if (!ctr2.Checked)
                    {
                        i++; 
                    }
                    if (i >= 2) {
                        MessageBox.Show("Veuillez cocher une radiobutton", "Message", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                        bol = false;
                        break;
                    }
                }

            }
            return bol;
        }

        private void metroTabPage4_Click(object sender, EventArgs e)
        {

        }
        public void Clear_metroTabPage1() {

            foreach (Control ctrl in metroTabPage1.Controls)
            {

                if (ctrl is MetroFramework.Controls.MetroTextBox) ctrl.Text = null;
                if (ctrl is MetroFramework.Controls.MetroComboBox)
                {
                    var ctr2 = ctrl as MetroFramework.Controls.MetroComboBox;
                    ctr2.SelectedIndex = -1;
                }
                if (ctrl is MetroFramework.Controls.MetroRadioButton)
                {
                    var ctr2 = ctrl as MetroFramework.Controls.MetroRadioButton;
                    ctr2.Checked = false;
                }
                if (ctrl is MetroFramework.Controls.MetroDateTime)
                {
                    var ctr2 = ctrl as MetroFramework.Controls.MetroDateTime;
                    ctr2.Value = DateTime.Now;
                }
                if(ctrl is PictureBox)
                {
                    ctrl.BackgroundImage = new Bitmap(GestEmp.Properties.Resources.user4);
                }



            }

        }

        private void metroGrid1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i = e.RowIndex;
            if (i < metroGrid1.Rows.Count-1 && i>0)
            {
                string ID = metroGrid1.Rows[i].Cells[1].Value.ToString();
                DataRow[] Drow = Provider.ds.Tables["Employee"].Select("ID_EMP="+ID);
                LBL_Mod_Sup_IdEmp.Text = Drow[0][0].ToString();
                LBL_Mod_Sup_Tel.Text = Drow[0][3].ToString();
                LBL_Mod_Sup_Depart.Text = Drow[0][13].ToString();
                LBL_Mod_Sup_Email.Text = Drow[0][4].ToString();
            }

        }
        string TypeRecherche = null;
        private void metroComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CB_Mod_Sup_Chercher.SelectedItem.ToString() == "Numero Telephone") { TypeRecherche = "Tel"; }
            else if (CB_Mod_Sup_Chercher.SelectedItem.ToString() == "Nom") { TypeRecherche = "Nom"; }
            else  if(CB_Mod_Sup_Chercher.SelectedItem.ToString() == "Prénom") { TypeRecherche = "Prenom"; }

        }

        private void metroTextBox21_TextChanged(object sender, EventArgs e)
        {
            string s = "";
            DataRow[] datarow;
            DataTable dt = Provider.ds.Tables["Employee"].Clone();
            if (TypeRecherche == "Tel") {
                 s = "Tel ='" + TXB_Mod_Sup_Chercher.Text.ToString()+"' ";
              //  MessageBox.Show(""+Provider.dt2.Rows.Count);
            }
            if(TypeRecherche == "Nom") {
                 s = "Nom ='" + TXB_Mod_Sup_Chercher.Text.ToString() + "' ";
                //  MessageBox.Show(""+Provider.dt2.Rows.Count);
            }
            if (TypeRecherche == "Prenom") {
                s = "Prenom ='" + TXB_Mod_Sup_Chercher.Text.ToString() + "' ";
                //  MessageBox.Show(""+Provider.dt2.Rows.Count);
            }

            datarow = Provider.ds.Tables["Employee"].Select(s);
            foreach (DataRow Drow in datarow)
                dt.ImportRow(Drow);
        Provider.dt2 = dt.DefaultView.ToTable(true, "ID_EMP", "Nom", "Prenom", "Tel", "id_ville", "sexe", "adress");

            metroGrid1.DataSource = Provider.dt2;
            
        }
    }
}
