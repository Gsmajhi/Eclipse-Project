<nav class="navbar navbar-expand-lg navbar-dark bg-success">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fa-solid fa-house-medical"></i> Home
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Navigation items aligned to the left -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" href="doctor.jsp">DOCTOR</a></li>
                <li class="nav-item"><a class="nav-link active" href="view_doctor.jsp">VIEW DOCTOR</a></li>
                <li class="nav-item"><a class="nav-link active" href="patients.jsp">PATIENTS</a></li>
                <li class="nav-item"><a class="nav-link active" href="">APPOINTMENT</a></li>
            </ul>
            <!-- Dropdown aligned to the right -->
            <form class="d-flex">
                <div class="dropdown">
                    <button class="btn btn-success dropdown-toggle" type="button"
                        id="dropdownMenuButton1" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        <i class="fa-solid fa-user"></i> Admin
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</nav>
